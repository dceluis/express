FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }

    trait :confirmed do
      confirmed_at Time.current
    end

    factory :admin do
      first_name { 'Luis Felipe' }
      last_name { 'Sanchez' }
      email { 'luis@express.com' }
      password { 'zUgY66yi' }
      confirmed_at Time.current
    end
  end
end
