default_user_email = 'admin@writespeakcode.com'
puts "=== Creating #{default_user_email} user with password 'password'"
if user = AdminUser.where(email: default_user_email).empty?
  user = FactoryGirl.create(:admin_user, email: default_user_email)
end

puts "=== Seeding people"
person = FactoryGirl.create(:person)
speaker_draft = FactoryGirl.create(:person, :phone, :profile, :mentor)
organizer = FactoryGirl.create(:person, :phone, :job, :organizer)

puts "=== Seeding talks"
def create_speaker_for_talk(talk, speaker_role = :speaker)
  num = rand(7)
  num = 1 unless (num % 3 == 0)

  (0..num).each do |n|
    speaker = FactoryGirl.create(:displayed_speaker)
    TalkSpeaker.create(person: speaker, talk: talk, speaker_role: :speaker, order: n)
  end
end

def create_talk_and_speaker(track, day, session)
  talk = FactoryGirl.create(:talk, track, day: day, session_type: session)
  create_speaker_for_talk(talk)
end

Talk.days.each do |day_name, day_val|
  2.times do |n|
    talk = FactoryGirl.create(:keynote_talk, day: day_val)
    create_speaker_for_talk(talk)
  end

  Talk.session_types.each do |session_name, session_val|
    create_talk_and_speaker(:both_tracks, day_val, session_val)
    create_talk_and_speaker(:alumna_only, day_val, session_val)
    create_talk_and_speaker(:first_year_only, day_val, session_val)
  end
end
