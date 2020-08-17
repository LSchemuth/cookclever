# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"
require 'faker'
require 'json'

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

# puts "Cleaning database..."
# Amount.destroy_all
# Ingredient.destroy_all
# Order.destroy_all
# Recipe.destroy_all
# Supermarket.destroy_all
# Basket.destroy_all
# User.destroy_all

# puts "Creating user"
# user = User.create(email: "lschemuth@hotmail.de", password: "111111")

# puts 'Creating 56 fake supermarkets...'
# counter = 0
# addresses_array = []
# addresses = JSON.parse(File.read(Rails.root.join('addresses.json')))
# # addresses = JSON.parse(File.read'/home/pmoeller/code/LSchemuth/cookclever/addresses.json')
# addresses.each do |address|
#   addresses_array << address["address"]
# end

# supermarket_name = [ "Rewe", "Lidl", "Edeka", "Albert Heijn", "Carrefour", "Aldi", "Tesco", "Sainsbury's" ]

# 15.times do
#   supermarket = Supermarket.new(
#     name: supermarket_name.sample,
#     address: addresses_array[counter],
#     # address: addresses[counter],
#     user: user
#     )
#   counter += 1

#   supermarket.save!

#   recipes = []
#   rand(2..7).times do
#     recipe = Recipe.new(
#       title:  Faker::Food.dish,
#       description: Faker::Food.description,
#       supermarket_id: supermarket.id,
#       )
#     file = URI.open("https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
#     recipe.photo.attach(io: file, filename: "#{recipe.title}.png", content_type: 'image/png')
#     recipe.save!
#     recipes << recipe
# end

#   recipes.each do |recipe|
#     rand(2..10).times do
#       ingredient = Ingredient.create(
#         name:  Faker::Food.ingredient,
#         price:  rand(1..4),
#         # price: Faker::Number.decimal(l_digits= 2, r_digits= 2).within(range: 0..4),
#         expiration_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
#         supermarket_id: supermarket.id
#         )
#       amount = Amount.create(
#         quantity: rand(1..5),
#         unit: Faker::Food.metric_measurement,
#         recipe_id: recipe.id,
#         ingredient_id: ingredient.id
#       )
#     end
#   end
# puts "finished one supermarket"
# end


# puts 'Finished!'

puts "Cleaning database..."
Amount.destroy_all
Ingredient.destroy_all
Order.destroy_all
Recipe.destroy_all
Supermarket.destroy_all
Basket.destroy_all
User.destroy_all


require 'uri'
require 'net/http'
require 'openssl'

#lib/active_storage/service/cloudinary_service.rb:31
def handle_string_io_as_file(io, filename)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

puts "Creating user"
user = User.create(email: "lschemuth@hotmail.de", password: "111111")

puts 'Creating 15 fake supermarkets...'
counter = 0
addresses_array = []
addresses = JSON.parse(File.read(Rails.root.join('addresses.json')))
# addresses = JSON.parse(File.read'/home/pmoeller/code/LSchemuth/cookclever/addresses.json')
addresses.each do |address|
  addresses_array << address["address"]
end

supermarket_name = [ "Rewe", "Lidl", "Edeka", "Albert Heijn", "Carrefour", "Aldi", "Tesco", "Sainsbury's" ]

6.times do
  p supermarket = Supermarket.new(
    name: supermarket_name.sample,
    address: addresses_array[counter],
    # address: addresses[counter],
    user: user
    )
  counter += 1

  supermarket.save!

  recipes = []
  3.times do
    # API CALL
    begin
      url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random")
      
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
      request["x-rapidapi-key"] = '79df08cf1amsh2662634d1ced4d2p1f8ed2jsn710d56080115'
      
      response = http.request(request)
      api_answer = JSON.parse response.read_body
      api_recipe = api_answer["recipes"].first
      # binding.pry
    rescue => exception
      p exception
    end

    # Recipe creation
    p recipe = Recipe.new(
      title:  api_recipe['title'],
      description: api_recipe['instructions'],
      supermarket: supermarket,
      )
    file = URI.open(api_recipe['image'])
    type = api_recipe['imageType']
    recipe.photo.attach(io: file, filename: "#{recipe.title}.#{type}", content_type: "image/#{type}")
    recipe.save!
   

    # Ingredients creation for this recipe
    api_recipe["extendedIngredients"].each do |api_ingredient|
        p ingredient = Ingredient.new(
          name:  api_ingredient["name"],
          price:  rand(0.1..0.6),
          expiration_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
          supermarket: supermarket
          )
          p api_ingredient["image"]
          p url = "https://www.spoonacular.com/cdn/ingredients_100x100/#{api_ingredient["image"]}"
          io = URI.open(url)
          file = handle_string_io_as_file(io, api_ingredient["image"])
          ingredient.photo.attach(io: file, filename: "#{ingredient.name}", content_type: "image/jpg}")
          ingredient.save!

        amount = Amount.create!(
          quantity: api_ingredient["amount"],
          unit: api_ingredient["unit"],
          recipe: recipe,
          ingredient: ingredient
        )
    end
  end
  puts "finished a supermarket"
end


puts 'Finished!'

