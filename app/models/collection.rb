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

end
