FactoryGirl.define do
  factory :curator do
    username Faker::Internet.user_name
    name Faker::Name.name
  end
end
