FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    user 
    latitude  { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
