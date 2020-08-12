# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"
require 'faker'

# Examples:
# Recipe.destroy_all
# Supermarket.destroy_all
# Basket.destroy_all
# User.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user = User.create(email: "lschemuth@hotmail.de", password: "111111")
# supermarket1 = Supermarket.create(name: "SPAR", address: "Rapenburg 91, Amsterdam", user: user)
# supermarket2 = Supermarket.create(name: "Louis XVI", address: "Marnixstraat 5, Amsterdam", user: user)
# supermarket3 = Supermarket.create(name: "Albert Heijn", address: "Haarlemmerplein 34, Amsterdam", user: user)
# supermarket4 = Supermarket.create(name: "SH Supermarkt", address: "Van Baerlestraat 33, Amsterdam", user: user)
# supermarket5 = Supermarket.create(name: "Dirk van den Broek", address: "Warmoesstraat 157-163, Amsterdam", user: user)
# supermarket6 = Supermarket.create(name: "Nes Supermarket", address: "Nes 89, Amsterdam", user: user)
# supermarket7 = Supermarket.create(name: "LIDL", address: "Sara Burgerhartstraat 80, Amsterdam", user: user)
# supermarket8 = Supermarket.create(name: "AH Eerste van Swindenstraat", address: "Eerste Van Swindenstraat 91, Amsterdam", user: user)

# recipe = Recipe.create(title: "Currysausage", description: "Very tasty but spicy.", supermarket: supermarket1)
# file = URI.open('https://res.cloudinary.com/dovh6vnvn/image/upload/v1597241663/Download_1_twljdp.jpg')
# recipe.photo.attach(io: file, filename: recipe.title, content_type: 'image/jpg')

puts "Cleaning database..."
Recipe.destroy_all
Supermarket.destroy_all
Basket.destroy_all
User.destroy_all

puts "Creating user"
user = User.create(email: "lschemuth@hotmail.de", password: "111111")

puts 'Creating 100 fake supermarkets...'
100.times do
  supermarket = Supermarket.new(
    name:  Faker::Restaurant.name,
    address: 
      (addresses = JSON.parse(File.read'/home/pmoeller/code/LSchemuth/cookclever/addresses.json')
      addresses.each do |address|
        Supermarket.address.create(address: address["address, city"])
      end)


    # address: "#{Faker::Address.street_name}, #{Faker::Address.city}",
    recipe: 
    rand(2..10).times do
      recipe = Recipe.new(
        title:  Faker::Food.dish,
        description: Faker::Food.description,
        supermarket: self.id,
        photo:     
        ingredient: rand(2..10).times do
            ingredient = Ingredient.new(
              name:  Faker::Food.ingredient,
              price: Faker::Number.decimal(l_digits= 2, r_digits= 2).within(range: 0..4),
              expiration_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
              amounts: Faker::Food.measurement,
              supermarket_id: self.id
            )
          end,
      )
    end

    user: user
    # rating:  rand(0..5)
  )
  supermarket.save!
end


puts 'Finished!'






# -----------

# puts 'Creating 100 fake restaurants...'
# 100.times do
#   restaurant = Restaurant.new(
#     name:    Faker::Company.name,
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     rating:  rand(0..5)
#   )
#   restaurant.save!
# end
# puts 'Finished!'

# # -----------

# puts 'Creating 5 products...'
# 5.times do |i|
#   product = Product.create!(
#     name: Faker::Company.name,
#     tagline: Faker::Company.catch_phrase
#   )
#   puts "#{i + 1}. #{product.name}"
# end
# puts 'Finished!'

# require "faker"
# # TODO: Write a seed to insert 100 posts in the database
# require 'faker'
# 100.times do
#   Post.create(title: Faker::Hacker.say_something_smart, url: Faker::Internet.url,
#               votes: Faker::Number.within(range: 1..10_000_000))
# end

# # -----------
# require 'json'

# puts "Cleaning database..."
# Ingredient.destroy_all

# puts "Creating ingredients..."
# url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

# ingredient_data = open(url).read
# ingredients = JSON.parse(ingredient_data)

# ingredients["drinks"].each do |ingredient|
#   Ingredient.create(name: ingredient["strIngredient1"])
# end

# puts "Finished!"
