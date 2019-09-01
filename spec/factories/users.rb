FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    password { "Passw0rd" }
    password_confirmation  { "Passw0rd" }

    trait :admin do 
      after(:create) do |user|
        user.role = Role.where(name: 'Admin').first_or_create
      end
    end
  end
end
