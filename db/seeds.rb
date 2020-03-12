# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.destroy_all
Type.destroy_all
# Cart.destroy_all
Transit.destroy_all
Manager.destroy_all
Administrator.destroy_all
Zone.destroy_all


mode = ["Normal", "Rapide"]
trans = ["DHL", "Midex", "ASL"]
img = ["baobab.png", "curcuma.png", "gingembre.png", "macis.jpg", "muscade.jpg", "voatsiperifery.jpg"]
cont = ["Vrac", "Doypack","null"]
prix = [100, 200, 300, 400, 500, 600]

# Zone
zone1 = ["La Réunion", "Comores", "Maurice", "Mayotte", "Seychelles"]
zone2 = ["France", "Monaco", "Kenya", "Afrique du Sud"]
zone3 = ["Andorre", "Autriche", "Belgique", "Italie", "Island", "Irland", "Gibraltar", "Pays-bas", "Portugal", "Royaume-Uni", "Danemark", "Espagne", "Malte", "Luxemburg", "Allemagne", "Liechtenstein", "Suède", "Suisse", "Tchéque", "Finland", "Norvege", "Vatican city"]


zone1.length.times do |i|
    Zone.create(name: zone1[i])
end

zone2.length.times do |i|
    Zone.create(name: zone2[i])
end

zone3.length.times do |i|
    Zone.create(name: zone3[i])
end

Manager.create(email: "madepices@manager.com", password: "azerty")

8.times do |i|
   Article.create(title: Faker::Dessert.flavor, description: Faker::Quote.matz, season: Faker::Nation.language, origin: Faker::Nation.nationality, image_url: img[rand(5)])
end

puts "vita article"

# 12.times do |i|
#     Type.create(content: cont[rand(2)])
# end
# puts "vita type"

# 12.times do |i|
#     Product.create(article_id: rand(Article.first.id .. Article.last.id), price: 100)
# end
# puts "product create"

3.times do |i|
    Transit.create(name: trans[rand(0..2)], mode: mode[1], price: prix[rand(0..2)])
end

3.times do |i|
    Transit.create(name: trans[rand(0..2)], mode: mode[0], price:  prix[rand(3..5)])
end

puts "vita transit"

Administrator.create(email: "madepices@admin.com", password: "azerty", first_name: "Admin", last_name: "User")