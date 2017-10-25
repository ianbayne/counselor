# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "start seeding."

User.destroy_all
Counsellor.destroy_all

i = 1
p "Seed counsellors"
10.times do

  specialty_list = Counsellor::SPECIALTY.shuffle

  p specialty_list

  counsellor = Counsellor.create(
    first_name: "first_name#{i}",
    last_name: "last_name#{i}",
    age: (30..60).to_a.sample,
    gender: (0..1).to_a.sample,
    email: "counsellor#{i}@test.com", 
    password: "123456")

  3.times do
    counsellor.specialty_list.add(specialty_list.pop)
  end

  url = ["https://cdn3.iconfinder.com/data/icons/rcons-user-action/32/boy-512.png",
        "https://cdn2.iconfinder.com/data/icons/person-gender-hairstyle-clothes-variations/48/Female-Side-comb-O-neck-512.png"]
  counsellor.remote_photo_url = url[counsellor.gender]
  counsellor.save! 

  p "create counsellor\##{i}"
  p "first_name", counsellor.first_name
  p "last_name", counsellor.last_name
  p "age", counsellor.age
  p "gender", counsellor.gender
  p "photo_url", counsellor.photo
  p "email:", counsellor.email
  p "password:", counsellor.password
  i += 1
end

p "Finished seeding."

# QUESTIONS#
p "Seed questions"

question = Question.create(content: "Work-related issues", active: true)
p "create question \##{question.id}"
p "content:", question.content
p "active: #{question.active}"

question = Question.create(content: "Relationship issues", active: true)
p "create question \##{question.id}"
p "content:", question.content
p "active: #{question.active}"

question = Question.create(content: "Loss of family or friend issues", active: true)
p "create question \##{question.id}"
p "content:", question.content
p "active: #{question.active}"

question = Question.create(content: "Financial issues", active: true)
p "create question \##{question.id}"
p "content:", question.content
p "active: #{question.active}"

question = Question.create(content: "Other issues", active: true)
p "create question \##{question.id}"
p "content:", question.content
p "active: #{question.active}"

question = Question.create(content: "Do you prefer a male counsellor?", active: true)
p "create question \##{question.id}"
p "content:", question.content
p "active: #{question.active}"

question = Question.create(content: "Do you prefer a female counsellor?", active: true)
p "create question \##{question.id}"
p "content:", question.content
p "active: #{question.active}"

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

