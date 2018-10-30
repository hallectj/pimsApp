# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patientList = [
  ["Anderson", "Arn", "Orion", "1979-04-15"],
  ["Levi", "Richard", "Brian", "1990-02-03"],
  ["Bradford", "Brandi", "Sue", "1989-05-17"],
  ["Aikers", "Mary", "Louis", "1982-03-29"]
]
<<<<<<< HEAD
=======

>>>>>>> b099cc9da22e096a832d9f3a7f085eedf3bb74fe
userList = [
  {email: "doctor@example.com", password: "password", password_confirmation: "password", doctor_role: true},
  {email: "office@example.com", password: "password", password_confirmation: "password", office_role: true},
  {email: "volunteer@example.com", password: "password", password_confirmation: "password", volunteer_role: true},
  {email: "medical@example.com", password: "password", password_confirmation: "password", medical_role: true}
]
<<<<<<< HEAD
=======

userList.each do |user|
  User.create user
end

>>>>>>> b099cc9da22e096a832d9f3a7f085eedf3bb74fe
patientList.each do |last, first, middle, birth|
  Patient.create(last_name: last, first_name: first, middle_name: middle, birthday: birth)
end

userList.each do |user|
  User.create user
end
