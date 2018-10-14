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


patientList.each do |last, first, middle, birth|
  Patient.create(last_name: last, first_name: first, middle_name: middle, birthday: birth)
end
