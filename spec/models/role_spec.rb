require 'rails_helper'

describe Role, type: :model do

  it { should belong_to(:curator) }
  it { should belong_to(:collection) }
  it { should validate_presence_of(:curator) }
  it { should validate_presence_of(:collection) }

end
