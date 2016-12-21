# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Rails.env.development?
  puts "Deleting users"
  User.destroy_all
  puts "Destroying Resources"
  Resource.destroy_all
  puts "Destroying Catagories"
  Category.destroy_all

end

NUM = 10

puts "Creating Users"
NUM.times do
  User.create(username:   Faker::Internet.user_name,
              first_name: Faker::Name.first_name,
              last_name:  Faker::Name.last_name,
              email:      Faker::Internet.safe_email,
              password:   "foobar123")
end

puts "Creating Catagories"
3.times do
  Category.create( name:  Faker::Company.buzzword)
end



puts "Creating Resources"
NUM.times do
  Resource.create(submitter_id: Faker::Number.between(User.first.id, User.last.id),
                  category_id:  Faker::Number.between(Category.first.id, Category.last.id),
                  title:        Faker::Hacker.noun,
                  subtitle:     Faker::Hacker.say_something_smart,
                  description:  Faker::Lorem.paragraph,
                  media_type:   [0,1,2].sample,
                  credits:      Faker::Internet.name
                  )
end
