# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

limit = 10
#query_params = "red+dress"
shopstyle_response= open("http://api.shopstyle.com/api/v2/products?pid=#{Dotenv.load["SHOPSTYLE_TOKEN"]}&fts=#{query_params}&offset=0&limit=#{limit}").read
