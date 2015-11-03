class Curator < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_curator, :against => {
    :name => 'A', :username => 'B' },
    :using => {
      :tsearch => {:dictionary => "english"}
    }

  has_attached_file :avatar,
    styles: {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" },
      :convert_options => {
        :thumb => "-quality 75 -strip" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  has_many :collections
  has_many :observations_made, :foreign_key => 'curator_id', :class_name => "Observation"
  has_many :collection_observations, :through => :collections, :source => :observations
  has_many :roles
  has_many :authorized_collections, :through => :roles, :source => :collection
  validates :name, presence: true

  def can_create?(coll)
    Role.find_by(curator_id: self.id, collection_id: coll.id, can_create: true)
  end

  def can_read?(coll)
    Role.find_by(curator_id: self.id, collection_id: coll.id, can_read: true)
  end

  def can_update?(coll)
    Role.find_by(curator_id: self.id, collection_id: coll.id, can_update: true)
  end

  def can_invite?(coll)
    Role.find_by(curator_id: self.id, collection_id: coll.id, can_invite: true)
  end

  def admin?(coll)
    Role.find_by(curator_id: self.id, collection_id: coll.id, admin: true)
  end

  def is_user?(user)
    self.id == user.id
  end

  def has_pending_sightings?
    self.collection_observations.where(pending: true).order(updated_at: :desc).any?
  end

  def public_name
    if self.usernameqa
      self.username
    else
      self.name
    end
  end
end
