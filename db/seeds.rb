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
Question.destroy_all
Appointment.destroy_all

i = 1
p "Seed counsellors"
p "specialty_list for counsellor as below."
p Counsellor::SPECIALTY

20.times do

  specialty_list = Counsellor::SPECIALTY.shuffle

  counsellor = Counsellor.new(
    # first_name: "first_name#{i}",
    # last_name: "last_name#{i}",
    age: (30..60).to_a.sample,
    gender: (0..1).to_a.sample,
    email: "counsellor#{i}@test.com",
    password: "123456")

  # add 3 random speciality to counsellor from specilty list
  3.times do
    counsellor.specialty_list.add(specialty_list.pop)
  end

  # random Japanese name to counsellor based on gender
  gimei = counsellor.gender == 0 ? Gimei.male : Gimei.female
  roman_name = gimei.romaji.split(" ")
  first_name = roman_name[0]
  last_name = roman_name[1]
  counsellor.first_name = first_name
  counsellor.last_name = last_name

  url = ["https://cdn3.iconfinder.com/data/icons/rcons-user-action/32/boy-512.png",
        "https://cdn2.iconfinder.com/data/icons/person-gender-hairstyle-clothes-variations/48/Female-Side-comb-O-neck-512.png"]
  counsellor.remote_photo_url = url[counsellor.gender]
  counsellor.save!

  # introduction
  introduction = "Hi there.
  My name is #{counsellor.first_name} and I am a Mental Health and Addictions Counselor licensed in Japan with over 8 years of clinical experience.
  I hold a Masters of Arts in Counseling Psychology.
  I am also certified with the National Board of Certified Counselors.
  I have worked with clients with a wide range of concerns
  including depression, anxiety, grief, relationship issues, addiction problems, career challenges, and life transitions.
  I have also helped individuals with a history of trauma, including emotional and physical abuse."

  counsellor.introduction = introduction

  p "create counsellor\##{i}"
  p "gender", counsellor.gender
  p "first_name", counsellor.first_name
  p "last_name", counsellor.last_name
  p "introduction", counsellor.introduction
  p "age", counsellor.age
  p "photo_url", counsellor.photo
  p "email:", counsellor.email
  p "password:", counsellor.password
  i += 1
end

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

question = Question.create(content: "Do you prefer a male counsellor?", active: false)
p "create question \##{question.id}"
p "content:", question.content
p "active: #{question.active}"

question = Question.create(content: "Do you prefer a female counsellor?", active: false)
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

  p "seed mood of user, past 10days from today"
  day = Date.today - 10.days
  10.times do
    mood = Mood.new(mood: rand(1..5), user: user, created_at: day, updated_at: day)
    mood.save!
    day += 1.day
  end

  p "create user\##{i}"
  p "user_name:", user.user_name
  p "email:", user.email
  p "counsellor:", user.counsellor.email
  i += 1
end


p "Seed Appointments"

Appointment.create(
  start_time: DateTime.new(2017,10,26,11),
  end_time: DateTime.new(2017,10,26,12),
  user_id: User.all.sample.id,
  counsellor_id: Counsellor.all.sample.id)
Appointment.create(
  start_time: DateTime.new(2017,10,27,11),
  end_time: DateTime.new(2017,10,27,12),
  user_id: User.all.sample.id,
  counsellor_id: Counsellor.all.sample.id)
Appointment.create(
  start_time: DateTime.new(2017,10,26,15),
  end_time: DateTime.new(2017,10,26,16),
  user_id: User.all.sample.id,
  counsellor_id: Counsellor.all.sample.id)
Appointment.create(
  start_time: DateTime.new(2017,10,25,15),
  end_time: DateTime.new(2017,10,25,16),
  user_id: User.all.sample.id,
  counsellor_id: Counsellor.all.sample.id)
Appointment.create(
  start_time: DateTime.new(2017,10,24,18),
  end_time: DateTime.new(2017,10,24,19),
  user_id: User.all.sample.id,
  counsellor_id: Counsellor.all.sample.id)

p "Finished seeding."
