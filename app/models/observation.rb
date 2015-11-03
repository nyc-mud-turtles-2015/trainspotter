class Observation < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]

  belongs_to :curator
  belongs_to :collection, touch: true

  validates :curator, :collection, presence: true
  has_one :pending_observation

  validates :curator, :collection, presence: true

  validate :at_least_one

  def approved?
    !self.pending
  end

private

  def at_least_one
    if [self.description, self.image].reject(&:blank?).size == 0
       errors[:base] << "Please fill in at least one of the fields"
    end
  end

end
