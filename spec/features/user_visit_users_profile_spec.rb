require 'rails_helper'
feature 'User visit users profile' do
  scenario 'Successfully',login:true do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                           user: @user)

    # simula a ação do usuário
    visit root_path
    click_on recipe.title
    click_on @user.email

    expect(page).to have_css('.avatar')
    expect(page).to have_css('h1', text:@user.email)
    expect(page).to have_content(recipe.title)
  end
end
