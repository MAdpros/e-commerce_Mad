# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.destroy_all
Type.destroy_all
Cart.destroy_all
Delivery.destroy_all

mode = ["Normal", "Rapide"]
trans = ["DHL", "Midex", "ASL"]
img = ["baobab.png", "curcuma.png", "gingembre.png", "macis.jpg", "muscade.jpg", "voatsiperifery.jpg"]
cont = ["Vrac", "Doypack","null"]

6.times do |i|
   Article.create(title: Faker::Dessert.flavor, description: Faker::Quote.matz, season: Faker::Nation.language, origin: Faker::Nation.nationality, image_url: img[rand(5)])
end

puts "vita article"

12.times do |i|
    Type.create(content: cont[rand(2)])
end
puts "vita type"

12.times do |i|
    Product.create(article_id: rand(Article.first.id .. Article.last.id), type_id: rand(Type.first.id .. Type.last.id), price: 100)
end
puts "product create"

3.times do |i|
    Delivery.create(transit: trans[rand(0..2)], mode: mode[1], price: 100)
end

3.times do |i|
    Delivery.create(transit: trans[rand(0..2)], mode: mode[0], price: 200)
end
 puts "Livraison fait"