require 'rails_helper'

#example code:
# describe User, type: :model do
#   context "associations" do
#     it "should have_many questions" do
#       user = User.reflect_on_association(:questions)
#       user.macro.should == :has_many
#     end
#     it "should have_many answers" do
#       user = User.reflect_on_association(:answers)
#       user.macro.should == :has_many
#     end
#     it "should have_many votes" do
#       user = User.reflect_on_association(:votes)
#       user.macro.should == :has_many
#     end
#     it "should have_many responses" do
#       user = User.reflect_on_association(:responses)
#       user.macro.should == :has_many
#     end
#   end

#   it "should require a username" do
#       expect(FactoryGirl.build(:user, :username => "")).to be_invalid
#   end

#   it "should require a username" do
#       expect(FactoryGirl.build(:user, :username => "Feather")).to be_valid
#   end

#   it "should require an email" do
#       expect(FactoryGirl.build(:user, :email => "")).to be_invalid
#   end


#   it "should have a valid email" do
#       expect(FactoryGirl.build(:user, :email => "feather")).to be_invalid
#   end

#   it "should have a valid email" do
#       expect(FactoryGirl.build(:user, :email => "feather@gmail.com")).to be_valid
#   end

#   it "should require a password" do
#       expect(FactoryGirl.build(:user, :password => nil)).to be_invalid
#   end

#   it "should require a password" do
#       expect(FactoryGirl.build(:user, :password => "password")).to be_valid
#   end

# end
