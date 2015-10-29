require 'rails_helper'

Rspec.describe Observation, type: :model do
  context "associations" do
    it "should belongs_to curator" do
      observation = Observation.reflect_on_association(:curator)
      observation.macro.should == :belongs_to
    end
    it "should belongs_to collection" do
      observation = Observation.reflect_on_association(:collection)
      observation.macro.should == :belongs_to
    end
  end
end
