FactoryGirl.define do
  factory :person do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    trait :phone do
      phone { Faker::PhoneNumber.phone_number }
    end

    trait :mentor do
      mentor true
    end

    trait :organizer do
      organizer true
    end
  end
end
