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

# Ingredient.destroy_all
# Cocktail.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredient_arr = JSON.parse(open(url).read)['drinks']
ingredient_arr.each do |hash|
  Ingredient.create(name: hash['strIngredient1'])
end

20.times do
  Cocktail.create(name: Faker::HitchhikersGuideToTheGalaxy.character)
end

# puts "done"
