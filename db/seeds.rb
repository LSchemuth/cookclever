# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"
# Examples:
Recipe.destroy_all
Supermarket.destroy_all
Basket.destroy_all
User.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: "lschemuth@hotmail.de", password: "111111")
supermarket1 = Supermarket.create(name: "SPAR", address: "Rapenburg 91, Amsterdam", user: user)
supermarket2 = Supermarket.create(name: "Louis XVI", address: "Marnixstraat 5, Amsterdam", user: user)
supermarket3 = Supermarket.create(name: "Albert Heijn", address: "Haarlemmerplein 34, Amsterdam", user: user)
supermarket4 = Supermarket.create(name: "SH Supermarkt", address: "Van Baerlestraat 33, Amsterdam", user: user)
supermarket5 = Supermarket.create(name: "Dirk van den Broek", address: "Warmoesstraat 157-163, Amsterdam", user: user)
supermarket6 = Supermarket.create(name: "Nes Supermarket", address: "Nes 89, Amsterdam", user: user)
supermarket7 = Supermarket.create(name: "LIDL", address: "Sara Burgerhartstraat 80, Amsterdam", user: user)
supermarket8 = Supermarket.create(name: "AH Eerste van Swindenstraat", address: "Eerste Van Swindenstraat 91, Amsterdam", user: user)

recipe = Recipe.create(title: "Currysausage", description: "Very tasty but spicy.", supermarket: supermarket1)
file = URI.open('https://res.cloudinary.com/dovh6vnvn/image/upload/v1597241663/Download_1_twljdp.jpg')
recipe.photo.attach(io: file, filename: recipe.title, content_type: 'image/jpg')
