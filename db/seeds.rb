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

puts "Cleaning database..."
Amount.destroy_all
Ingredient.destroy_all
Order.destroy_all
Recipe.destroy_all
Supermarket.destroy_all
Basket.destroy_all
User.destroy_all

puts "Creating user"
user = User.create(email: "lschemuth@hotmail.de", password: "111111")

puts 'Creating 56 fake supermarkets...'
counter = 0
addresses_array = []
addresses = JSON.parse(File.read(Rails.root.join('addresses.json')))
# addresses = JSON.parse(File.read'/home/pmoeller/code/LSchemuth/cookclever/addresses.json')
addresses.each do |address|
  addresses_array << address["address"]
end

supermarket_name = [ "Rewe", "Lidl", "Edeka", "Albert Heijn", "Carrefour", "Aldi", "Tesco", "Sainsbury's" ]

15.times do
  supermarket = Supermarket.new(
    name: supermarket_name.sample,
    address: addresses_array[counter],
    # address: addresses[counter],
    user: user
    )
  counter += 1

  supermarket.save!

  recipes = []
  rand(2..7).times do
    recipe = Recipe.new(
      title:  Faker::Food.dish,
      description: Faker::Food.description,
      supermarket_id: supermarket.id,
      )
    file = URI.open("https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80")
    recipe.photo.attach(io: file, filename: "#{recipe.title}.png", content_type: 'image/png')
    recipe.save!
    recipes << recipe
end

  recipes.each do |recipe|
    rand(2..10).times do
      ingredient = Ingredient.create(
        name:  Faker::Food.ingredient,
        price:  rand(1..4),
        # price: Faker::Number.decimal(l_digits= 2, r_digits= 2).within(range: 0..4),
        expiration_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
        supermarket_id: supermarket.id
        )
      amount = Amount.create(
        quantity: rand(1..5),
        unit: Faker::Food.metric_measurement,
        recipe_id: recipe.id,
        ingredient_id: ingredient.id
      )
    end
  end
puts "finished one supermarket"
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


            # url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

          # ingredient_data = open(url).read
          # ingredients = JSON.parse(ingredient_data)

          # ingredients["drinks"].each do |ingredient|
          #   Ingredient.create(name: ingredient["strIngredient1"])
          # end

          # puts "Finished!"
