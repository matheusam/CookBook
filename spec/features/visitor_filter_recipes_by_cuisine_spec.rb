require 'rails_helper'
feature 'Visitor filter recipes by cuisine' do
  scenario 'Successfully' do
    cuisine = create(:cuisine, name: 'Brasileira')
    recipe = create(:recipe, cuisine: cuisine)

    visit root_path
    click_on recipe.cuisine.name

    expect(page).to have_css('h1', text: recipe.title)
  end

  scenario 'No recipes found' do
    cuisine = create(:cuisine, name: 'Brasileira')

    visit root_path
    click_on cuisine.name

    expect(page).to have_css('p', text: "Nenhuma receita #{cuisine.name} cadastrada")
  end
end
