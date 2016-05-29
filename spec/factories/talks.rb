FactoryGirl.define do
  factory :talk do
    title { Faker::Book.title }
    description { Faker::Lorem.sentences(5).join("<br><br>")}
    session_type { Talk.session_types.values.shuffle.first }
    day { Talk.days.values.shuffle.first }

    trait :first_year_only do
      alumna_track false
      first_year_track true
    end

    trait :alumna_only do
      alumna_track true
      first_year_track false
    end

    trait :both_tracks do
      alumna_track true
      first_year_track true
    end

    trait :keynote do
      session_type 1
      keynote true
    end

    factory :keynote_talk, traits: [:both_tracks, :keynote]
  end
end
