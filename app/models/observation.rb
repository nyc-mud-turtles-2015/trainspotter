class Observation < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]

  belongs_to :curator
  belongs_to :collection, touch: true


  validates :curator, :collection, presence: true

  # def s3_credentials
  #   {
  #    bucket: Rails.application.secrets.s3_bucket,
  #    access_key_id: Rails.application.secrets.s3_key_id,
  #    secret_access_key: Rails.application.secrets.s3_secret_key
  #   }
  # end
  # , :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

end
