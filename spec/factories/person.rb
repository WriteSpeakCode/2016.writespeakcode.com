FactoryGirl.define do
  factory :person do
    name { Faker::Name.name }
    email { Faker::Internet.email }

    trait :profile do
      bio { Faker::Hipster.sentences(3).join("<br><br>") }
      twitter { Faker::App.name.downcase }
      github { Faker::App.name.downcase }
      linkedin { "https://linkedin.com/in/#{Faker::Internet.slug}" }
      website { Faker::Internet.url }
    end

    trait :job do
      job_title { Faker::Company.profession.titleize }
      company { Faker::Company.name }
    end

    trait :phone do
      phone { Faker::PhoneNumber.phone_number }
    end

    trait :mentor do
      mentor true
    end

    trait :organizer do
      organizer true
    end

    trait :display do
      display true
    end

    factory :displayed_speaker, traits: [:profile, :phone, :job, :mentor, :display]
    factory :draft_speaker, traits: [:profile, :mentor]
    factory :organizer, traits: [:profile, :phone, :job, :organizer]
  end
end
