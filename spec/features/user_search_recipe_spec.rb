require 'rails_helper'
feature 'User search recipe' do
  scenario 'user find only searched recipes' do
    user = login
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
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

    visit root_path
    fill_in 'Procurar', with: marmelada.title
    click_on 'Buscar'

    expect(page).to have_css('h3', text: 'Resultados da pesquisa:')
    expect(page).to have_css('h1', text: marmelada.title)
    expect(page).to have_css('li', text: marmelada.cook_time)
    expect(page).to have_css('li', text: marmelada.difficulty)
    expect(page).not_to have_css('h1', text: goiabada.title)
  end

  scenario 'No results' do
    visit root_path
    fill_in 'Procurar', with: 'Doce de leite'
    click_on 'Buscar'

    expect(page).to have_css('h3', text: 'Resultados da pesquisa:')
    expect(page).to have_css('p', text: 'Nenhum resultado encontrado.')
  end

  scenario 'find more than one' do
    user = login
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
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

    visit root_path
    fill_in 'Procurar', with: 'ada'
    click_on 'Buscar'

    expect(page).to have_css('h3', text: 'Resultados da pesquisa:')
    expect(page).to have_css('h1', text: marmelada.title)
    expect(page).to have_css('li', text: marmelada.cook_time)
    expect(page).to have_css('li', text: marmelada.difficulty)
    expect(page).to have_css('h1', text: goiabada.title)
    expect(page).to have_css('li', text: goiabada.cook_time)
    expect(page).to have_css('li', text: goiabada.difficulty)
  end
end
