FactoryGirl.define do
  factory :curator do
    name Faker::Name.name
    avatar Faker::Avatar.image(Faker::Number.number(10))
  end
end
