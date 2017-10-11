FactoryGirl.define do
  factory :event do
    name              "Party"
    description       "Surprise for someone"
    location          { Faker::Address.city }
    includes_food     false
    includes_drinks   true
    price             5
    starts_at         10.days.from_now
    ends_at           12.days.from_now
    capacity          20
    active            true
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
