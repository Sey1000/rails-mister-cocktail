require 'json'
require 'open-uri'
require 'faker'

Cocktail.destroy_all
Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredient_arr = JSON.parse(open(url).read)['drinks'].map { |ing_hash| ing_hash['strIngredient1'].capitalize }.sort
ingredient_arr.each do |ing|
  Ingredient.create(name: ing)
end

20.times do
  Cocktail.create(name: Faker::HitchhikersGuideToTheGalaxy.character)
end
