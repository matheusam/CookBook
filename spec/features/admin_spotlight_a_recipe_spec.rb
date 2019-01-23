require 'rails_helper'
feature 'Admin spotlight a recipe' do
  scenario 'Successfully' do
    user = login
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60, ingredients: 'Água, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços '\
                           'pequenos, misture com o restante dos ingredientes',
                           user: user)

    visit root_path
    click_on recipe.title
    click_on 'Marcar como destaque'

    expect(page).to have_css('.spotlight')
    visit root_path
    expect(page).to have_css('.spotlight')
  end
end
