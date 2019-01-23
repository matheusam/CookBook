require 'rails_helper'

feature 'Admin register recipe_type' do
  scenario 'successfully' do
    visit root_path
    click_on 'Tipos de receitas'
    fill_in 'Nome', with: 'Sobremesa'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Sobremesa')
  end

  scenario 'and must fill in name' do
    visit new_recipe_type_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome do tipo de receita')
  end

  scenario 'Unique' do
    recipe_type = RecipeType.create(name: 'Sobremesa')

    visit root_path
    click_on 'Tipos de receitas'
    fill_in 'Nome', with: recipe_type.name.upcase
    click_on 'Enviar'

    expect(page).to have_css('p', text: 'Esse tipo de receita já existe!')
  end
end
