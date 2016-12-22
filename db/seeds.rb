
#if Rails.env.development?
  #puts "Deleting users"
  #User.destroy_all
  #puts "Destroying Resources"
  #Resource.destroy_all
  #puts "Destroying Catagories"
  #Category.destroy_all
#end

def create_users(n = 10)
  #puts "Creating Users"
  n.times do
    User.create!(username:   Faker::Internet.user_name,
                first_name: Faker::Name.first_name,
                last_name:  Faker::Name.last_name,
                email:      Faker::Internet.safe_email,
                password:   'password')
  end
end

def create_sample_user
  User.create(username:   'sample_user',
              first_name: 'First',
              last_name:  'Last',
              email:      'user@example.com',
              password:   'password')
  puts "#{ User.count } users created"
end

#p "Your sample user email is foobar123@example.com and your password is foobar123"

def create_categories(n = 3)
  #puts "Creating Catagories"
  n.times do
    Category.create!(name: "#{Faker::Company.buzzword}(n)")
  end
  puts "#{ Category.count } categories created"
end



def create_resources(n = 10)
  #puts "Creating Resources"
  n.times do
    Resource.create(submitter_id: Faker::Number.between(User.first.id, User.last.id),
                    category_id:  Faker::Number.between(Category.first.id, Category.last.id),
                    title:        Faker::Hacker.noun,
                    subtitle:     Faker::Hacker.say_something_smart,
                    description:  Faker::Lorem.paragraph,
                    media_type:   [0,1,2].sample,
                    credits:      Faker::Internet.user_name)
  end
  puts "#{ Resource.count } resources created"
end

create_users
create_sample_user
create_categories
create_resources
