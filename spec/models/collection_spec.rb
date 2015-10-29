require 'rails_helper'

describe Collection, type: :model do
  context "associations" do
    it "should belongs_to curator" do
      collection = Collection.reflect_on_association(:curator)
      collection.macro.should == :belongs_to
    end
    it "should have_many observations" do
      collection = Collection.reflect_on_association(:observations)
      collection.macro.should == :has_many
    end
  end

  it "should require a title" do
      expect(FactoryGirl.build(:collection, :title => "")).to be_invalid
  end

  it "should require a title" do
      expect(FactoryGirl.create(:collection)).to be_valid
  end
end
