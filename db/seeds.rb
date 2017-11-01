# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "start seeding."

Appointment.destroy_all
Mood.destroy_all
Question.destroy_all
User.destroy_all
Counsellor.destroy_all

i = 1
p "Seed counsellors"
# p "first ten counsellors are male, last ten counsellors are female"
p "specialty_list for counsellor as below."
p Counsellor::SPECIALTY

p "counsellors for demo, 3 male and 3 female."
p "Please choose Work, Relationship, Loss and No preference for gender to have consistent matching result."

counsellor = Counsellor.new(
    first_name: "Kazuya",
    last_name: "Nakajima",
    age: 31,
    gender: 0,
    email: "counsellor_kazuya@gmail.com",
    password: "123456",
    photo: File.open(File.join(Rails.root, "app/assets/images/counsellor_m1.png"))
    )

counsellor.specialty_list.add([:Work, :Relationship, :Loss])

introduction = "Hi there.
My name is Kazuya and I am a Mental Health and Addictions Counselor licensed in Japan with over 8 years of clinical experience.
I hold a Masters of Arts in Counseling Psychology.
I am also certified with the National Board of Certified Counselors.
I have worked with clients with a wide range of concerns
including depression, anxiety, grief, relationship issues, addiction problems, career challenges, and life transitions.
I have also helped individuals with a history of trauma, including emotional and physical abuse."

counsellor.introduction = introduction
counsellor.save!

p "counsellor#{i} finished"
i += 1

gimei = Gimei.male

counsellor = Counsellor.new(
    first_name: gimei.romaji.split(" ")[0],
    last_name: gimei.romaji.split(" ")[1],
    age: 42,
    gender: 0,
    email: "counsellor_2@gmail.com",
    password: "123456",
    photo: File.open(File.join(Rails.root, "app/assets/images/counsellor_m2.png"))
    )

counsellor.specialty_list.add([:Work, :Relationship, :Financial])

introduction = "I am a Licensed Professional Counselor in the Tokyo, Japan. 
I received a Master's Degree in Counseling Psychology at Avila University in Kansas City, 
Missouri. I added a certification as a Personal Trainer through Smart Fitness because mental health, 
diet and exercise go hand in hand. "

counsellor.introduction = introduction
counsellor.save!

p "counsellor#{i} finished"
i += 1

gimei = Gimei.male

counsellor = Counsellor.new(
    first_name: gimei.romaji.split(" ")[0],
    last_name: gimei.romaji.split(" ")[1],
    age: 42,
    gender: 0,
    email: "counsellor_3@gmail.com",
    password: "123456",
    photo: File.open(File.join(Rails.root, "app/assets/images/counsellor_m3.png"))
    )

counsellor.specialty_list.add([:Work, :Relationship, :Financial])

introduction = "I am a licensed mental health counselor in Tokyo with over 3 years work in community mental health 
and 14 years experience in private practice, including 10 years as a certified clinical trainer for other counselors. 
I work a great deal with adult survivors of childhood abuse, but also with those dealing with depression and anxiety."

counsellor.introduction = introduction
counsellor.save!

p "counsellor#{i} finished"
i += 1

gimei = Gimei.female

counsellor = Counsellor.new(
    first_name: gimei.romaji.split(" ")[0],
    last_name: gimei.romaji.split(" ")[1],
    age: 42,
    gender: 1,
    email: "counsellor_4@gmail.com",
    password: "123456",
    photo: File.open(File.join(Rails.root, "app/assets/images/counsellor_f1.png"))
    )

counsellor.specialty_list.add([:Work, :Relationship, :Loss])

introduction = "I have a warm and friendly style 
and strongly believe in the importance of the therapeutic bond 
and building a healthy and trusting relationships with all of my clients. 
When working with me you can expect me to take a strong interest in your case 
and concern for your well-being. I own a sucessful private practice,
and am looking forward to bringing my services to many of you through BetterHelp's online counseling services. 
Take care and I look forward to working with you!"

counsellor.introduction = introduction
counsellor.save!

p "counsellor#{i} finished"
i += 1

gimei = Gimei.female

counsellor = Counsellor.new(
    first_name: gimei.romaji.split(" ")[0],
    last_name: gimei.romaji.split(" ")[1],
    age: 42,
    gender: 1,
    email: "counsellor_5@gmail.com",
    password: "123456",
    photo: File.open(File.join(Rails.root, "app/assets/images/counsellor_f2.png"))
    )

counsellor.specialty_list.add([:Work, :Relationship, :Loss])

introduction = "I have a warm and friendly style 
and strongly believe in the importance of the therapeutic bond 
and building a healthy and trusting relationships with all of my clients. 
When working with me you can expect me to take a strong interest in your case 
and concern for your well-being. I own a sucessful private practice,
and am looking forward to bringing my services to many of you through Counsellor.tokyo online counseling services. 
Take care and I look forward to working with you!"

counsellor.introduction = introduction
counsellor.save!

p "counsellor#{i} finished"
i += 1

gimei = Gimei.female

counsellor = Counsellor.new(
    first_name: gimei.romaji.split(" ")[0],
    last_name: gimei.romaji.split(" ")[1],
    age: 42,
    gender: 1,
    email: "counsellor_6@gmail.com",
    password: "123456",
    photo: File.open(File.join(Rails.root, "app/assets/images/counsellor_f3.png"))
    )

counsellor.specialty_list.add([:Work, :Relationship, :Financial])

introduction = "I'm a Licensed Professional Counselor 
and an Internationally Certified Alcohol and Drug Counselor. 
I have worked in a variety of settings to include both mental health 
and addiction treatment facilities. 
I have over 15 years experience in the counseling field addressing depression, anxiety, anger, trauma/abuse and addiction. 
I am also very comfortable providing crisis interventions to those 
that may be experiencing immediate distress!"

counsellor.introduction = introduction
counsellor.save!

p "counsellor#{i} finished"
i += 1

# disable normal counsellor seed
# if false
# 20.times do
#   specialty_list = Counsellor::SPECIALTY.shuffle

#   counsellor = Counsellor.new(
#     # first_name: "first_name#{i}",
#     # last_name: "last_name#{i}",
#     age: (30..60).to_a.sample,
#     gender: i <= 10 ? 0 : 1,
#     email: "counsellor#{i}@test.com",
#     password: "123456")

#   photo_num = i <= 10 ? i : i - 10
#   photo_gender = i <= 10 ? "m" : "f"
#   photo_path = "app/assets/images/counsellor_#{photo_gender}#{photo_num}.png"
#   p "photo_path is ", photo_path
#   photo = File.open(File.join(Rails.root, photo_path))
#   counsellor.photo = photo

#   # add 3 random speciality to counsellor from specilty list
#   3.times do
#     counsellor.specialty_list.add(specialty_list.pop)
#   end

#   # random Japanese name to counsellor based on gender
#   gimei = counsellor.gender == 0 ? Gimei.male : Gimei.female
#   roman_name = gimei.romaji.split(" ")
#   first_name = roman_name[0]
#   last_name = roman_name[1]
#   counsellor.first_name = first_name
#   counsellor.last_name = last_name

#   # url = ["https://cdn3.iconfinder.com/data/icons/rcons-user-action/32/boy-512.png",
#   #       "https://cdn2.iconfinder.com/data/icons/person-gender-hairstyle-clothes-variations/48/Female-Side-comb-O-neck-512.png"]
#   # counsellor.remote_photo_url = url[counsellor.gender]
#   counsellor.save!

#   # introduction
#   introduction = "Hi there.
#   My name is #{counsellor.first_name} and I am a Mental Health and Addictions Counselor licensed in Japan with over 8 years of clinical experience.
#   I hold a Masters of Arts in Counseling Psychology.
#   I am also certified with the National Board of Certified Counselors.
#   I have worked with clients with a wide range of concerns
#   including depression, anxiety, grief, relationship issues, addiction problems, career challenges, and life transitions.
#   I have also helped individuals with a history of trauma, including emotional and physical abuse."

#   counsellor.introduction = introduction

#   p "create counsellor\##{i}"
#   p "gender", counsellor.gender
#   p "first_name", counsellor.first_name
#   p "last_name", counsellor.last_name
#   p "introduction", counsellor.introduction
#   p "age", counsellor.age
#   p "photo_url", counsellor.photo
#   p "email:", counsellor.email
#   p "password:", counsellor.password
#   i += 1
# end
# end

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

p "no seed user for demo"

if false
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
end

p "no seed appointments as there are no users available"
# p "Seed Appointments"
if false
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
end

p "Finished seeding."
