require 'rails_helper'
feature 'Admin edit cuisine' do
  scenario 'Successfully',login:true do
    cuisine = Cuisine.create(name: 'Basileila')

    visit root_path
    click_on 'Cozinhas'
    click_on cuisine.name
    click_on 'Editar'
    fill_in 'Renomear', with: 'Brasileira'
    click_on 'Salvar'

    expect(page).to have_css('h1', text:'Brasileira')
  end
end
