require 'rails_helper'

feature 'Admin edit cuisine' do
  scenario 'Successfully' do
    user = login
    cuisine = Cuisine.create(name: 'Basileila')

    visit root_path
    click_on 'Cozinhas'
    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Renomear', with: 'Brasileira'
    click_on 'Salvar'

    expect(page).to have_css('h1', text:'Brasileira')
  end

  scenario 'and must fill in name' do
    user = login
    cuisine = Cuisine.create(name: 'Basileila')

    visit root_path
    click_on 'Cozinhas'
    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Renomear', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
  end

  scenario 'Unique' do
    user = login

    wrong_cuisine = Cuisine.create(name: 'Basileila')
    cuisine = Cuisine.create(name: 'Brasileira')

    visit root_path
    click_on 'Cozinhas'
    click_on wrong_cuisine.name
    click_on 'Editar'
    fill_in 'Renomear', with: cuisine.name.upcase
    click_on 'Salvar'

    expect(page).to have_content('Essa cozinha já está cadastrada!')
  end
end
