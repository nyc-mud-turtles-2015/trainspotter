class Role < ActiveRecord::Base
  belongs_to :curator
  belongs_to :collection

  validates :curator, :collection, presence: true
end
