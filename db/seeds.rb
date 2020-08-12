# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.all.last
supermarkets = Supermarket.create(name: "SPAR", address: "Rapenburg 91, Amsterdam", user: user)
supermarkets = Supermarket.create(name: "Louis XVI", address: "Marnixstraat 5, Amsterdam", user: user)
supermarkets = Supermarket.create(name: "Albert Heijn", address: "Haarlemmerplein 34, Amsterdam", user: user)
supermarkets = Supermarket.create(name: "SH Supermarkt", address: "Van Baerlestraat 33, Amsterdam", user: user)
supermarkets = Supermarket.create(name: "Dirk van den Broek", address: "Warmoesstraat 157-163, Amsterdam", user: user)
supermarkets = Supermarket.create(name: "Nes Supermarket", address: "Nes 89, Amsterdam", user: user)
supermarkets = Supermarket.create(name: "LIDL", address: "Sara Burgerhartstraat 80, Amsterdam", user: user)
supermarkets = Supermarket.create(name: "AH Eerste van Swindenstraat", address: "Eerste Van Swindenstraat 91, Amsterdam", user: user)
