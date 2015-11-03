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
    self.observations.where(pending: false).order(updated_at: :desc)
  end

  def pending_observations
    self.observations.where(pending: true).order(updated_at: :desc)
  end

  def user_can_add?(user)
    user.can_create?(self) || self.owned_by?(user) || user.admin?(self)
  end

  def public?
    !self.is_private
  end

  def visible_to_user?(user)
    self.public? || self.owned_by?(user)
  end

end
