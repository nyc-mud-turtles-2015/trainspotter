FactoryGirl.define do
  factory :observation do
    association :curator
    association :collection
    text Faker::Lorem.paragraph
  end
end
