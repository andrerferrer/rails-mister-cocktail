require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = JSON.parse(open(url).read)['drinks']

Ingredient.destroy_all
5.times { Ingredient.create(name: drinks.sample['strIngredient1']) }
