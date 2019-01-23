require 'rails_helper'
feature 'Admin edit recipe type' do
  scenario 'Successfully' do
    user = login
    recipe_type = RecipeType.create(name: 'Entrada')

    visit root_path
    click_on 'Tipos de receitas'
    click_on recipe_type.name
    fill_in 'Renomear', with: 'Sobremesa'
    click_on 'Salvar'

    expect(page).to have_css('h1', text:'Sobremesa')
  end

  scenario 'and must fill in name' do
    user = login
    recipe_type = RecipeType.create(name: 'Entrada')

    visit root_path
    click_on 'Tipos de receitas'
    click_on recipe_type.name
    fill_in 'Renomear', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve informar o tipo de receita')
  end

  scenario 'Unique' do
    user = login

    wrong_recipe_type = RecipeType.create(name: 'Entrada')
    recipe_type = RecipeType.create(name: 'Sobremesa')

    visit root_path
    click_on 'Tipos de receitas'
    click_on wrong_recipe_type.name
    fill_in 'Renomear', with: recipe_type.name.upcase
    click_on 'Salvar'

    expect(page).to have_content('Esse tipo de receita já existe!')
  end
end
