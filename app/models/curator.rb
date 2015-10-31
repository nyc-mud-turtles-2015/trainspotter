class Curator < ActiveRecord::Base

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
  has_many :observations
  has_many :roles
  has_many :authorized_collections, :through => :roles, :source => :collection
  validates :name, presence: true

end
