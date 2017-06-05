# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 321.times do
#   book = Book.new
#   book.title = Faker::Book.title
#   book.isbn = Faker::Crypto.md5
#   book.save
# end
AdminUser.create!(email: 'wlodku@post.pl', login: 'wlodku', password: 'mamamama', password_confirmation: 'mamamama')

grades = []
grades << Grade.new(name: 'IIa TE');
grades << Grade.new(name: 'IIIac TE');
grades << Grade.new(name: 'IIIb T6');
grades << Grade.new(name: 'Ia T6');
grades << Grade.new(name: 'Ia T5');
grades << Grade.new(name: 'IIa T5');
grades << Grade.new(name: 'IIb T5');
grades << Grade.new(name: 'IIIa T5');
grades << Grade.new(name: 'IVa T5');
grades << Grade.new(name: 'IVb T5');
grades << Grade.new(name: 'Nauczyciel');
Grade.import grades

users = []
grades_ids = Grade.ids
120.times do
  user = User.new
  user.name = Faker::Name.first_name
  user.surname = Faker::Name.last_name
  user.login = Faker::Name.first_name + ((1..100000).to_a).sample.to_s
  user.email = Faker::Internet::email
  user.grade_id = grades_ids.sample
  user.password = 'mamamama'
  user.password_confirmation = 'mamamama'
  users << user
end
User.import users
