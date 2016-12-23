
FactoryGirl.define do

  factory :user do
    sequence(:email ) { |n| "#{n}-user@example.com" }
    username 'user'
    password 'password'
  end

  factory :resource do
    title 'Title'
    subtitle 'Subtite'

    association :submitter, factory: :user

    trait :with_feedback do
      after(:create) do |resource|
        create(:feedback, feedbackable: resource)
      end
    end
  end

  factory :feedback do
    rating 4
    difficulty 5

    user

    association :feedbackable, factory: :resource
  end

end
