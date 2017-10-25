# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "start seeding."
p "only email is available for user and counsellor now."

 p "Seed users"
 i = 1
 5.times do
   user = User.create(email: "user#{i}@test.com", password: 123456)
   p "create user\##{i}"
   p "email:", user.email
   p "password:", user.password

   i += 1
 end

i = 1
p "Seed counsellors"
10.times do
  counsellor = Counsellor.create(email: "counsellor#{i}@test.com", password: 123456)
  p "create counsellor\##{i}"
  p "email:", counsellor.email
  p "password:", counsellor.password
  i += 1
end

p "Finished seeding."