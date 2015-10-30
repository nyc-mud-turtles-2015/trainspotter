FactoryGirl.define do
  factory :observation do
    association :curator
    association :collection
    description Faker::Lorem.paragraph
  end
end
