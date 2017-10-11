FactoryGirl.define do
  factory :event do
    name              { Faker::Lorem.word }
    description       { Faker::Lorem.sentence(40) }
    location          { Faker::Address.city }
    includes_food     false
    includes_drinks   true
    price             { Faker::Commerce.price }
    starts_at         10.days.from_now
    ends_at           12.days.from_now
    capacity          20
    
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
