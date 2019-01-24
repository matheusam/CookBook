require 'rails_helper'
feature 'User sign up' do
  scenario 'Successfully' do
    user = { email: 'rspec@test.com' }

    visit root_path
    click_on 'Criar Conta'
    fill_in 'Email', with: user[:email]
    fill_in 'Senha', with: 'rspec@test'
    fill_in 'Confirmar senha', with: 'rspec@test'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'test.jpg')
    click_on 'Criar conta'
    visit root_path
    click_on 'Meu perfil'

    expect(page).to have_css('.avatar')
    expect(page).to have_css('h1', text: user[:email])
    expect(page).not_to have_content('Criar Conta')
  end
end
