# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.destroy_all

img = ["baobab.png", "curcuma.png", "gingembre.png", "macis.jpg", "muscade.jpg", "voatsiperifery.jpg"]

6.times do |i|
    Article.create(title: Faker::Dessert.flavor, description: Faker::Quote.matz, season: Faker::Nation.language, origin: Faker::Nation.nationality, image_url: img[rand(5)])
end

puts "vita article"