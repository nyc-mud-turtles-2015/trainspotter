require 'rails_helper'
require_relative "../../app/models/curator.rb"

describe Curator, type: :model do
  context "associations" do
    it "should have_many collections" do
      curator = Curator.reflect_on_association(:collections)
      curator.macro.should == :has_many
    end
    it "should have_many observations" do
      curator = Curator.reflect_on_association(:observations)
      curator.macro.should == :has_many
    end
  end

  it "should require a username" do
      expect(FactoryGirl.build(:curator, :username => "")).to be_invalid
  end
end
