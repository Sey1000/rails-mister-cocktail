# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'faker'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"


# ingredient_arr = JSON.parse(open(url).read)['drinks']
# ingredient_arr.each do |hash|
#   Ingredient.create(name: hash['strIngredient1'])
# end

# ins = Ingredient.all.map(&:name)
# nums = (1..10).to_a
# doses_arr = %w[ml cc tsp piece drop Tsp]

# 20.times do
#   Cocktail.create(name: Faker::HitchhikersGuideToTheGalaxy.character)
# end

# 100.times do

# end