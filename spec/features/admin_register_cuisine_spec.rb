require 'rails_helper'

feature 'Admin register cuisine' do
  scenario 'successfully' do

    visit root_path
    click_on 'Cozinhas'
    fill_in 'Nova cozinha', with: 'Arabe'
    click_on 'Criar'

    expect(page).to have_css('h1', text: 'Arabe')
  end

  scenario 'and must fill in name' do
    visit new_cuisine_path
    fill_in 'Nova cozinha', with: ''
    click_on 'Criar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
  end

  scenario 'Unique' do

    cuisine = Cuisine.create(name: 'Arabe')

    visit root_path
    click_on 'Cozinhas'
    fill_in 'Nova cozinha', with: cuisine.name.upcase
    click_on 'Criar'

    expect(page).to have_css('p', text: 'Essa cozinha já está cadastrada!')
  end
end
