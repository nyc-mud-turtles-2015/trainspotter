require 'rails_helper'

describe Collection, type: :model do

  it { should have_many(:observations) }
  it { should belong_to(:curator) }
  it { should validate_presence_of(:title) }

end
