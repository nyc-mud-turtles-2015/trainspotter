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
  has_many :curators, :through => :observations, :source => :curator
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
    user.can_add?(self) || self.owned_by?(user) || user.admin?(self)
  end

  def public?
    !self.is_private
  end

  def visible_to_user?(user)
    self.public? || self.owned_by?(user)
  end

  def shortened_title
    title = self.title
    if title.length > 10
      return title[0..8] + "..."
    else
      return title
    end
  end

  # def updated_at_parser
  #   date = self.updated_at
  #   seconds = ((DateTime.now - date) / 1000).round
  #   interval = (seconds / 31536000).round
  #   if (interval > 1)
  #     return interval + " years"
  #   end
  #   interval = (seconds / 2592000).round
  #   if (interval > 1)
  #     return interval + " months"
  #   end
  #   interval = (seconds / 86400).round
  #   if (interval > 1)
  #     return interval + " days"
  #   end
  #   interval = (seconds / 3600).round
  #   if (interval > 0)
  #     if (interval == 1)
  #       return interval + " hour"
  #     end
  #     return interval + " hours"
  #   end
  #   interval = (seconds / 60).round
  #   if (interval > 1)
  #     return interval + " minutes"
  #   end
  #   return "just now"
  # end

end
