class Collection < ActiveRecord::Base
  belongs_to :curator
  has_many :observations

  validates :title, :curator, presence: true
end
