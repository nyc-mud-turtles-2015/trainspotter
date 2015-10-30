FactoryGirl.define do
  factory :collection do
    association :curator
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
  end
end

