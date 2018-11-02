# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patientList = [

  ["Anderson", "Arn", "Orion", "1979-04-15", "2018-10-20", "12:44am", "Chest Pain"],
  ["Levi", "Richard", "Brian", "1990-02-03", "2017-09-02", "4:15pm", "Diarrhea"],
  ["Bradford", "Brandi", "Sue", "1989-05-17", "2017-01-21", "7:25am", "Lung Cancer"],
  ["Aikers", "Mary", "Louis", "1982-03-29", "2018-05-12", "7:45pm", "Gunshot Wound"],
  ['Nayda', 'Faith', 'Hollee', '1936-02-22', '2016-06-22', '12:37', 'natoque'],
	['Dorian', 'Maggie', 'Summer', '2006-11-21', '2014-12-18', '21:19', 'dis'],
	['Thane', 'Brady', 'Ian', '1924-06-28', '2018-10-31', '11:24', 'adipiscing'],
	['Sean', 'Ulla', 'Bethany', '2001-10-05', '2014-05-03', '12:54', 'senectus'],
	['Wallace', 'Melvin', 'Declan', '1946-03-16', '2019-03-26', '21:10', 'Maecenas'],
	['Gary', 'Gabriel', 'Eugenia', '1935-11-21', '2014-04-12', '20:27', 'sodales.'],
	['Blaine', 'Emma', 'Fredericka', '1974-01-31', '2017-07-16', '16:48', 'varius'],
	['Winifred', 'Acton', 'Xenos', '1929-08-13', '2014-04-21', '00:00', 'leo.'],
	['Dean', 'Hasad', 'Wynne', '1946-02-19', '2014-06-07', '20:23', 'malesuada'],
	['Courtney', 'Sybil', 'Raya', '1961-07-01', '2017-10-18', '13:01', 'urna'],
	['Quamar', 'Beck', 'Denise', '1996-01-11', '2015-07-21', '20:09', 'elit.'],
	['Ivory', 'Zeph', 'Katell', '1986-01-20', '2019-06-21', '10:21', 'massa'],
	['Wylie', 'Norman', 'Dorothy', '1960-05-01', '2017-12-14', '14:15', 'risus.'],
	['Lacey', 'Gil', 'Logan', '1985-01-03', '2017-08-16', '23:30', 'condimentum'],
	['Ainsley', 'Ciaran', 'Harding', '1935-10-06', '2015-03-27', '04:47', 'consectetuer,'],
	['Simone', 'Diana', 'Jameson', '1998-08-23', '2018-11-23', '18:02', 'sem'],
	['Sybil', 'Nissim', 'Abdul', '1990-09-16', '2019-07-31', '18:45', 'fringilla.'],
	['Ryan', 'Phyllis', 'Libby', '1933-11-02', '2016-10-28', '22:04', 'eu'],
	['Brenden', 'Jana', 'Clark', '1931-07-24', '2018-04-16', '19:16', 'Nullam'],
	['Ginger', 'Edward', 'Blaze', '1990-04-13', '2016-12-05', '14:14', 'risus'],
	['Mara', 'Ross', 'Heidi', '2019-09-18', '2017-04-19', '22:50', 'eget'],
	['Dorian', 'Ryan', 'Lareina', '1936-07-12', '2018-05-03', '09:39', 'pede'],
	['Karyn', 'Flynn', 'Logan', '1984-08-06', '2018-10-16', '00:37', 'Morbi'],
	['Addison', 'Rebekah', 'Megan', '1979-12-24', '2016-01-25', '17:07', 'nonummy.'],
	['Kaden', 'Wing', 'Cyrus', '1924-06-14', '2018-11-11', '10:17', 'Sed'],
	['Skyler', 'Winter', 'Oren', '1979-07-26', '2014-06-28', '00:21', 'sem'],
	['Lois', 'Octavia', 'Lunea', '1992-08-10', '2015-03-30', '11:25', 'ante'],
	['Madeline', 'Trevor', 'Nash', '1965-01-19', '2015-06-29', '11:42', 'est,'],
	['Porter', 'Carla', 'Rigel', '1954-01-23', '2015-03-29', '18:34', 'Sed'],
	['Kellie', 'Grace', 'Rajah', '2005-10-10', '2014-07-31', '07:59', 'commodo'],
	['Mason', 'Lacota', 'Malcolm', '1983-09-01', '2017-07-25', '00:37', 'augue'],
	['Camilla', 'Damon', 'Ignatius', '1923-01-07', '2017-09-13', '05:40', 'auctor'],
	['Wade', 'Kameko', 'Xyla', '2017-04-26', '2018-11-25', '13:29', 'In'],
	['Davis', 'Fallon', 'Tyler', '1981-10-27', '2018-02-14', '13:56', 'molestie'],
	['Amelia', 'Briar', 'Tasha', '1986-08-13', '2015-02-15', '10:58', 'mollis'],
	['Carson', 'Noble', 'Joan', '1948-11-23', '2016-12-15', '12:10', 'Quisque'],
	['Driscoll', 'Cruz', 'Abigail', '1998-06-09', '2014-01-17', '20:20', 'nulla.'],
	['Knox', 'Zahir', 'Jade', '1976-10-06', '2016-10-07', '22:42', 'dui.'],
	['Lysandra', 'Valentine', 'Lysandra', '1925-12-20', '2018-08-18', '13:49', 'dapibus'],
	['Dillon', 'Charlotte', 'Thor', '1925-09-16', '2019-07-21', '15:28', 'consectetuer'],
	['Christen', 'John', 'Heidi', '1987-09-09', '2015-05-03', '23:11', 'Nunc'],
	['Abdul', 'Alexandra', 'Maggie', '1952-04-24', '2017-10-28', '22:13', 'velit'],
	['Jordan', 'Basil', 'Oprah', '1956-01-11', '2019-09-01', '18:28', 'elit.'],
	['Desiree', 'Jaquelyn', 'Jolene', '1987-10-16', '2017-11-13', '02:37', 'sollicitudin'],
	['Jena', 'Larissa', 'Shelby', '1954-07-30', '2017-06-06', '11:37', 'id'],
	['Kevin', 'Branden', 'Drew', '1988-10-29', '2018-04-25', '09:55', 'accumsan'],
	['Nayda', 'Rana', 'Amena', '1997-11-19', '2015-01-22', '00:02', 'Fusce'],
	['Herrod', 'Ivy', 'Astra', '1968-08-09', '2013-12-05', '11:45', 'Nulla'],
	['Joan', 'Paula', 'Ramona', '2011-07-17', '2017-03-19', '16:42', 'eu,'],
	['Nora', 'Thomas', 'Philip', '1942-03-27', '2017-03-16', '04:30', 'venenatis'],
	['Vivien', 'Carter', 'Wade', '1941-10-05', '2018-03-07', '16:39', 'eu'],
	['Abdul', 'Kylan', 'Rigel', '2008-12-28', '2017-10-31', '05:40', 'interdum'],
	['Shad', 'Callum', 'Addison', '1971-02-02', '2016-07-23', '20:52', 'Pellentesque'],
	['Theodore', 'Kermit', 'Alec', '1953-10-19', '2016-08-04', '02:25', 'nunc.'],
	['Naomi', 'Claire', 'Katelyn', '1993-06-11', '2017-10-16', '17:29', 'et'],
	['Flavia', 'Christopher', 'Xanthus', '1992-10-01', '2017-08-31', '16:56', 'adipiscing'],
	['Vanna', 'Kasper', 'Kaseem', '1955-11-11', '2015-06-08', '09:20', 'est'],
	['Jerome', 'Dana', 'Thane', '2008-10-17', '2017-11-16', '19:59', 'cursus'],
	['Macon', 'Ann', 'Gregory', '1927-05-12', '2016-03-13', '06:35', 'dui.'],
	['Xander', 'Aristotle', 'Evangeline', '1999-04-27', '2015-10-07', '05:05', 'Pellentesque'],
	['Sonia', 'Ali', 'Davis', '2015-12-17', '2017-11-22', '17:39', 'adipiscing'],
	['Slade', 'Skyler', 'Kelly', '2002-06-28', '2014-01-18', '13:14', 'rutrum.'],
	['Jeanette', 'Buckminster', 'Mark', '1997-08-11', '2013-11-28', '05:17', 'tincidunt'],
	['TaShya', 'Neil', 'Indira', '2000-05-21', '2016-09-28', '21:35', 'eget'],
	['Susan', 'Vaughan', 'Callum', '2014-02-19', '2016-01-15', '02:26', 'magna'],
	['Malcolm', 'Clio', 'Jesse', '2005-03-02', '2015-01-22', '21:08', 'neque.'],
	['Ivan', 'Colton', 'Melinda', '1964-07-12', '2016-06-20', '14:58', 'felis'],
	['Mariko', 'Quintessa', 'Charles', '1996-03-25', '2018-01-09', '17:19', 'a,'],
	['Graiden', 'Shelley', 'Hedy', '2007-09-01', '2017-05-05', '14:33', 'sem'],
	['Jenette', 'Bernard', 'Vera', '2001-05-19', '2019-06-19', '07:31', 'parturient'],
	['Daquan', 'Stuart', 'Jason', '1931-07-03', '2016-03-31', '19:17', 'velit'],
	['Odysseus', 'Cameron', 'Nathaniel', '1971-07-05', '2017-05-18', '08:03', 'parturient'],
	['Mason', 'Sean', 'Jorden', '1976-06-02', '2016-11-17', '11:58', 'Cras'],
	['Kane', 'Caesar', 'Ezekiel', '2006-07-16', '2017-04-26', '16:38', 'dictum'],
	['Kristen', 'Shaeleigh', 'Aristotle', '1934-07-23', '2014-03-11', '12:55', 'luctus'],
	['Zane', 'Fuller', 'Noelle', '1996-12-06', '2014-08-14', '11:16', 'ornare.'],
	['Dawn', 'Jack', 'Tamekah', '1983-02-20', '2018-05-20', '11:56', 'quam'],
	['Noelani', 'Blair', 'Benedict', '1972-10-03', '2016-05-31', '15:00', 'ut,'],
	['Rinah', 'Camden', 'Deirdre', '1953-02-25', '2015-05-19', '03:45', 'Curabitur'],
	['Stewart', 'Kaye', 'Sawyer', '2012-09-15', '2016-02-20', '17:37', 'mollis'],
	['Blossom', 'Lamar', 'Mikayla', '1987-08-12', '2018-04-20', '16:14', 'a,'],
	['Jasper', 'Jescie', 'Vielka', '1997-02-26', '2019-03-28', '23:21', 'quis,'],
	['Azalia', 'Felicia', 'Florence', '2017-01-29', '2017-06-23', '08:17', 'risus'],
	['Fritz', 'Jonah', 'Melvin', '1953-11-27', '2019-06-26', '03:51', 'nisi.'],
	['Zoe', 'Knox', 'Cedric', '1955-04-30', '2015-08-07', '00:26', 'libero'],
	['September', 'Amal', 'Leo', '1960-03-20', '2018-08-13', '11:28', 'enim'],
	['Angela', 'Gisela', 'Christian', '1924-08-16', '2014-05-05', '11:12', 'scelerisque'],
	['Griffin', 'Adara', 'Ethan', '1982-10-18', '2017-09-01', '01:04', 'Nullam'],
	['Leah', 'Boris', 'Elmo', '1978-07-24', '2015-10-03', '22:36', 'adipiscing'],
	['Martina', 'Howard', 'Whilemina', '1939-03-22', '2016-07-26', '21:18', 'ac'],
	['Isabelle', 'Pamela', 'Michael', '1978-06-13', '2018-09-13', '04:41', 'ligula.'],
	['Heather', 'Ray', 'Ulric', '1992-01-16', '2017-10-11', '14:25', 'suscipit'],
	['Wayne', 'Jade', 'Shannon', '1928-02-25', '2014-08-05', '13:09', 'dictum'],
	['Odette', 'Marsden', 'Omar', '1965-10-04', '2018-10-22', '04:17', 'varius'],
	['Farrah', 'Pascale', 'Stella', '1968-06-29', '2018-02-15', '16:53', 'erat'],
	['Vivien', 'Donna', 'Willow', '1930-04-05', '2018-11-28', '00:53', 'malesuada'],
	['Graham', 'Rooney', 'Kimberly', '2000-03-21', '2017-04-04', '05:19', 'Mauris'],
	['Fatima', 'Simon', 'Salvador', '1991-01-22', '2017-07-03', '17:57', 'eget,'],
	['Maryam', 'Imani', 'Kevin', '1930-09-29', '2015-01-04', '10:12', 'non'],
	['Burton', 'Anastasia', 'Daniel', '1968-04-28', '2014-11-04', '08:58', 'ridiculus']
]

userList = [
  {email: "doctor@example.com", password: "password", password_confirmation: "password", doctor_role: true},
  {email: "office@example.com", password: "password", password_confirmation: "password", office_role: true},
  {email: "volunteer@example.com", password: "password", password_confirmation: "password", volunteer_role: true},
  {email: "medical@example.com", password: "password", password_confirmation: "password", medical_role: true}
]

superUser = User.create(email: "admin@example.com", password: "password", password_confirmation: "password", superadmin_role: true)

patientList.each do |last, first, middle, birth, adate, atime, areason|
  @pat = Patient.create(last_name: last, first_name: first, middle_name: middle, birthday: birth)
  @pat.build_admittance(date: adate, time: atime, reason: areason)
  @pat.save

end

# patientList.each do |last, first, middle, birth, adate, atime, areason|
#   pat = Patient.where(lastname: last)
#   pat.update_a_admit(date: adate, time: atime, reason: areason)
# end

userList.each do |user|
  User.create user
end



