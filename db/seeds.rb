# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user_1 = User.create!(first_name: 'Rajeev', last_name: 'Khangar', email: 'rajeev@example.com')
user_2 = User.create!(first_name: 'Preethi', last_name: 'k', email: 'preethi@example.com')

lib_1 = Library.create!(name: 'Library-1')
lib_2 = Library.create!(name: 'Library-2')
lib_3 = Library.create!(name: 'Library-3')
lib_4 = Library.create!(name: 'Library-4')

book_1 = Book.create!(name: 'C language', description: 'This is C Language book', library: lib_1)
book_2 = Book.create!(name: 'C++ language', description: 'This is C++ Language book', library: lib_2)
book_3 = Book.create!(name: 'Java language', description: 'This is Java Language book', library: lib_3)
book_4 = Book.create!(name: 'Ruby language', description: 'This is Ruby Language book', library: lib_4)
book_5 = Book.create!(name: 'Python language', description: 'This is Python Language book', library: lib_4)

book_1.books_users.create!(user: user_1, allocated_at: Time.now)
book_5.books_users.create!(user: user_2, allocated_at: Time.now)
