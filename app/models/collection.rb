class Collection < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_collection, :against => {
    :title => 'A',
    :description => 'B'
    },
    :using => {
      :tsearch => {:dictionary => "english"}
    }

  belongs_to :curator

  has_many :observations

  has_many :roles
  has_many :authorized_users, :through => :roles, :source => :curator

  validates :title, :curator, presence: true

  def owned_by?(user)
    self.curator_id == user.id
  end

  def approved_observations
    self.observations.order(updated_at: :desc).reject { |obs| obs.is_pending? }
  end

  def pending_observations
    self.observations.order(updated_at: :desc).select { |obs| obs.is_pending? }
  end

  def has_pending_observations?
    self.pending_observations.any?
  end

  def has_approved_observations?
    !self.approved_observations.empty?
  end

  def user_can_add?(user)
    user.can_create?(self) || self.owned_by?(user) || user.admin?(self)
  end

  def public?
    !self.private
  end

  def private?
    self.private
  end

  def visible_to_user?(user)
    self.public? || self.owned_by?(user)
  end

end
