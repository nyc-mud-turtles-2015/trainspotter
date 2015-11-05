class Observation < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200#" }, default_url: "/images/blank.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]

  belongs_to :curator
  belongs_to :collection, touch: true

  validates :curator, :collection, presence: true
  has_one :pending_observation

  validate :at_least_one

  def approved?
    !self.pending
  end

  def has_image?
    self.image_file_name.present?
  end

  def owned_by?(user)
    self.curator_id == user.id
  end

  private

  def at_least_one
    if [self.description, self.image].reject(&:blank?).size == 0
       errors.add(:base, "Make sure you add at least a description or photo")
    end
  end

end
