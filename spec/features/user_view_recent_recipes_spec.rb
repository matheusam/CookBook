require 'rails_helper'
feature 'User view recent recipes' do
  scenario 'Last six recipes' do
    user = login
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    rapadura = Recipe.create(title: 'Rapadura', recipe_type: recipe_type,
                             cuisine: cuisine, difficulty: 'médio',
                             cook_time: 20, ingredients: 'Açucar',
                             cook_method: 'Cozinhe o açucar no fogo',
                             user: user)
    marmelada = Recipe.create(title: 'Marmelada', recipe_type: recipe_type,
                              cuisine: cuisine, difficulty: 'fácil',
                              cook_time: 10, ingredients: 'Marmelo',
                              cook_method: 'Cozinhe o marmelo no fogo',
                              user: user)
    goiabada = Recipe.create(title: 'Goiabada', recipe_type: recipe_type,
                             cuisine: cuisine, difficulty: 'médio',
                             cook_time: 20, ingredients: 'Goiaba',
                             cook_method: 'Cozinhe a goiaba no fogo',
                             user: user)
    bananada = Recipe.create(title: 'Bananada', recipe_type: recipe_type,
                             cuisine: cuisine, difficulty: 'fácil',
                             cook_time: 10, ingredients: 'Banana',
                             cook_method: 'Cozinhe a banana no fogo',
                             user: user)
    figada = Recipe.create(title: 'Figada', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'médio',
                           cook_time: 20, ingredients: 'Figo',
                           cook_method: 'Cozinhe o figo no fogo',
                           user: user)
    laranjada = Recipe.create(title: 'Laranjada', recipe_type: recipe_type,
                              cuisine: cuisine, difficulty: 'fácil',
                              cook_time: 10,
                              ingredients: 'Laranja',
                              cook_method: 'Cozinhe a laranja no fogo',
                              user: user)
    doce_leite = Recipe.create(title: 'Doce de leite', recipe_type: recipe_type,
                               cuisine: cuisine, difficulty: 'fácil',
                               cook_time: 10,
                               ingredients: 'Leite',
                               cook_method: 'Cozinhe o leite no fogo',
                               user: user)

    visit root_path

    expect(page).to have_css('h1', text: doce_leite.title)
    expect(page).to have_css('h1', text: laranjada.title)
    expect(page).to have_css('h1', text: figada.title)
    expect(page).to have_css('h1', text: bananada.title)
    expect(page).to have_css('h1', text: goiabada.title)
    expect(page).to have_css('h1', text: marmelada.title)
    expect(page).not_to have_css('h1', text: rapadura.title)
  end
end
