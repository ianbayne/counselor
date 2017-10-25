# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "start seeding."
p "only email is available for user and counsellor now."

i = 1
p "Seed counsellors"
10.times do
  counsellor = Counsellor.create(
    first_name: "first_name#{i}",
    last_name: "last_name#{i}",
    age: (30..60).to_a.sample,
    gender: (0..1).to_a.sample,
    email: "counsellor#{i}@test.com", 
    password: "123456")
  p "create counsellor\##{i}"
  p "first_name", counsellor.first_name
  p "last_name", counsellor.last_name
  p "age", counsellor.age
  p "gender", counsellor.gender
  p "email:", counsellor.email
  p "password:", counsellor.password
  i += 1
end

p "Seed users"
i = 1
5.times do
  user_counsellor = Counsellor.where('id >= ?', rand((Counsellor.first.id)..(Counsellor.last.id))).first

  user = User.create(user_name: "user_name#{i}", 
    email: "user#{i}@test.com", 
    password: "123456",
    counsellor: user_counsellor)

  p "create user\##{i}"
  p "user_name:", user.user_name
  p "email:", user.email
  p "counsellor:", user.counsellor.email
  i += 1
end

p "Finished seeding."