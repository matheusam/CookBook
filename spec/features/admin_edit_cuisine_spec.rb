require 'rails_helper'

feature 'Admin edit cuisine' do
  scenario 'Successfully' do
    login
    cuisine = make_cuisine(name: 'Basileila')

    visit root_path
    click_on 'Cozinhas'
    click_on cuisine.name
    fill_in 'Renomear', with: 'Brasileira'
    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Brasileira')
  end

  scenario 'and must fill in name' do
    login
    cuisine = make_cuisine(name: 'Basileila')

    visit root_path
    click_on 'Cozinhas'
    click_on cuisine.name
    fill_in 'Renomear', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
  end

  scenario 'Unique' do
    login
    good_cuisine = make_cuisine(name: 'Basileila')
    bad_cuisine = make_cuisine(name: 'Brasileira')

    visit root_path
    click_on 'Cozinhas'
    click_on bad_cuisine.name
    fill_in 'Renomear', with: good_cuisine.name.upcase
    click_on 'Salvar'

    expect(page).to have_content('Essa cozinha já está cadastrada!')
  end
end
