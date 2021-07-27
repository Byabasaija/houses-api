FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password 'foobar'
  end
end
