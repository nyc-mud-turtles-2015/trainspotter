class Curator < ActiveRecord::Base
  has_many :collections
  has_many :observations

end
