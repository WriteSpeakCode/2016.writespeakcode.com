FactoryGirl.define do
  factory :talk_speaker do
    person
    talk
    order { (1..6).to_a.sample }
  end

end
