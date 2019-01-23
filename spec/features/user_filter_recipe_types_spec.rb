require 'rails_helper'
feature 'User filter recipes' do
  scenario 'Successfully' do
    user = login
    dessert = RecipeType.create(name: 'Sobremesa')
    starter = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Brasileira')
    marmelada = Recipe.create(title: 'Marmelada', recipe_type: dessert,
                           cuisine: cuisine, difficulty: 'fácil',
                           cook_time: 10,
                           ingredients: 'Marmelo',
                           cook_method: 'Cozinhe o marmelo no fogo',
                           user: user)
    bacon = Recipe.create(title: 'Bacon', recipe_type: starter,
                          cuisine: cuisine, difficulty: 'médio',
                          cook_time: 20,
                          ingredients: 'Porco',
                          cook_method: 'Frite o Porco no fogo',
                          user: user)

    visit root_path
    click_on dessert.name

    expect(page).to have_css('h1', text:marmelada.title)
    expect(page).to have_css('li', text: marmelada.recipe_type.name)
    expect(page).to have_css('li', text: marmelada.cuisine.name)
    expect(page).to have_css('li', text: marmelada.difficulty)
    expect(page).to have_css('li', text: "#{marmelada.cook_time} minutos")
    expect(page).not_to have_content(bacon.title)
    expect(page).not_to have_content(bacon.difficulty)
    expect(page).not_to have_content(bacon.cook_time)
  end

  scenario 'No recipes found' do
    fast_food = RecipeType.create(name: 'Fast food')

    visit root_path
    click_on fast_food.name

    expect(page).to have_css('p', text:'Nenhum resultado encontrado.')
  end
end
