require 'rails_helper'
feature 'User delete recipe' do
  scenario 'successfully' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    marmelada = Recipe.create(title: 'Marmelada', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'fácil',
                           cook_time: 10,
                           ingredients: 'Marmelo',
                           cook_method: 'Cozinhe o marmelo no fogo')

    visit root_path
    click_on  marmelada.title
    click_on 'Deletar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Receita apagada com sucesso!')
    expect(page).not_to have_css('h1', text:marmelada.title)
  end
end
