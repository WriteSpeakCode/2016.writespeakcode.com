default_user_email = 'admin@writespeakcode.com'
puts "Creating #{default_user_email} user with password 'password'"
if user = AdminUser.where(email: default_user_email).empty?
  user = FactoryGirl.create(:admin_user, email: default_user_email)
end

puts "Seeding people"

person = FactoryGirl.create(:person)
speaker = FactoryGirl.create(:person, :phone, :profile, :mentor, :display)
speaker_draft = FactoryGirl.create(:person, :phone, :profile, :mentor)
organizer = FactoryGirl.create(:person, :phone, :job, :organizer)
