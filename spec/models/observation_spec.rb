require 'rails_helper'

describe Observation, type: :model do

  it { should belong_to(:curator) }
  it { should belong_to(:collection) }

end
