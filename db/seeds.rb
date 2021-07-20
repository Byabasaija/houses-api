# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
    house = House.create(name: Faker::Lorem.word, image_url: 'https://unsplash.com/photos/kUdbEEMcRwE', description: '2100 Club, the world’s first blockchain bar, designed by LYCS Architecture.The bar is participated by many well-known entrepreneurs and cornerstone investors in the Blockchain industry. 2100 Club is a social platform that shares and exchanges the cutting edge blockchain technologies, researches and investments. The slogan of 2100Club shares the idea ‘to own, to live to live until 2100’ to all the new economic drivers and innovators. It has been further developed as the basis design concept of interior space which interpreting its intellectual spirit instead of creating a theme bar.')
  end