require 'rails_helper'
feature 'Admin edit recipe type' do
  scenario 'Successfully' do
    login
    recipe_type = make_recipe_type

    visit root_path
    click_on 'Tipos de receitas'
    click_on recipe_type.name
    fill_in 'Renomear', with: 'Sobremesa'
    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Sobremesa')
  end

  scenario 'and must fill in name' do
    login
    recipe_type = make_recipe_type

    visit root_path
    click_on 'Tipos de receitas'
    click_on recipe_type.name
    fill_in 'Renomear', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve informar o tipo de receita')
  end

  scenario 'Unique' do
    login
    bad_recipe_type = make_recipe_type
    good_recipe_type = make_recipe_type

    visit root_path
    click_on 'Tipos de receitas'
    click_on bad_recipe_type.name
    fill_in 'Renomear', with: good_recipe_type.name.upcase
    click_on 'Salvar'

    expect(page).to have_content('Esse tipo de receita já existe!')
  end
end
