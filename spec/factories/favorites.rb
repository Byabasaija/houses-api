FactoryBot.define do
  factory :favorite do
    user_id { Faker::Number.number }
    house_id { Faker::Number.number }
  end
end
