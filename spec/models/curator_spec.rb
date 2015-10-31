require 'rails_helper'
require 'spec_helper'

describe Curator, type: :model do

  it { should have_many(:collections) }
  it { should have_many(:observations) }

end
