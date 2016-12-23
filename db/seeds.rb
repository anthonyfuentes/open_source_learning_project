
if Rails.env.development?
  puts "Deleting Users"
  User.destroy_all
  puts "Destroying Resources"
  Resource.destroy_all
  puts "Destroying Catagories"
  Category.destroy_all
  puts "Destroying Links"
  Link.destroy_all
end

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
    Category.create!(name: "#{Faker::Company.buzzword.capitalize}(n)")
  end
  puts "#{ Category.count } categories created"
end



def create_resources(n = 10)
  #puts "Creating Resources"
  n.times do
    Resource.create(submitter_id: Faker::Number.between(User.first.id, User.last.id),
                    category_id:  Faker::Number.between(Category.first.id, Category.last.id),
                    title:        Faker::Hacker.noun.titleize,
                    subtitle:     Faker::Hacker.say_something_smart,
                    description:  Faker::Lorem.paragraph,
                    media_type:   [0,1,2].sample,
                    credits:      Faker::Name.name)
  end
  puts "#{ Resource.count } resources created"
end

def create_links
  #puts "Giving links to resources"
  Resource.all.each do |n|
    n.links.create(
      url: Faker::Internet.url
    )
  end
end

def create_tags(n = 4)
  Resource.all.each do |resource|
    n.times do
      resource.tags.create(
        name: Faker::Hacker.noun
      )
    end
  end
  puts "#{ Tag.count } tags created"
end

def create_curriculums(n = 10)
  n.times do
    Curriculum.create!(
      creator_id: Faker::Number.between(User.first.id, User.last.id),
      title:        "#{Faker::Hacker.noun.titleize} #{Faker::Hacker.noun.titleize}",
      subtitle:     Faker::Hacker.say_something_smart,
      description:  Faker::Lorem.paragraph
      )
  end

  puts "#{ Curriculum.count } curriculums created"
end

def add_resources_to_curriculums( curriculums )
  resources = Resource.all

  curriculums.each do |curriculum|
    while curriculum.resources.length < 3
      r = resources.sample
      unless curriculum.resources.include? r
        curriculum.resources << r
      end
    end
  end

  puts "Resources add to curriculums"

end

create_users
create_sample_user
create_categories
create_resources(30)
create_links
create_tags
create_curriculums(30)
add_resources_to_curriculums(Curriculum.all)
