class Observation < ActiveRecord::Base

  belongs_to :curator
  belongs_to :collection, touch: true

  validates :curator, :collection, presence: true

end
