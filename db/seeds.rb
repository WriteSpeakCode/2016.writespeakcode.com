default_user_email = 'admin@writespeakcode.com'
puts "=== Creating #{default_user_email} user with password 'password'"
if user = AdminUser.where(email: default_user_email).empty?
  user = FactoryGirl.create(:admin_user, email: default_user_email)
end

puts "=== Seeding people"
person = FactoryGirl.create(:person)
speaker = FactoryGirl.create(:person, :phone, :profile, :mentor, :display)
speaker_draft = FactoryGirl.create(:person, :phone, :profile, :mentor)
organizer = FactoryGirl.create(:person, :phone, :job, :organizer)

puts "=== Seeding talks"

Talk.days.each do |day_name, day_val|
  2.times { |n| FactoryGirl.create(:keynote_talk, day: day_val) }

  Talk.session_types.each do |session_name, session_val|
    FactoryGirl.create(:talk, :both_tracks, day: day_val, session_type: session_val)
    FactoryGirl.create(:talk, :alumna_only, day: day_val, session_type: session_val)
    FactoryGirl.create(:talk, :first_year_only, day: day_val, session_type: session_val)
  end
end
