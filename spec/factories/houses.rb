FactoryBot.define do
    factory :house do
      name { Faker::Lorem.word }
      image_url { Faker::LoremFlickr.image }
      description { Faker::Lorem.sentence}
    end
  end