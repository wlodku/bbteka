# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

321.times do
  book = Book.new
  book.title = Faker::Book.title
  book.isbn = Faker::Crypto.md5
  book.save
end
AdminUser.create!(email: 'wlodku@gmail.com', password: 'mamamama', password_confirmation: 'mamamama')
