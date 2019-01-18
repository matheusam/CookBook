require 'rails_helper'
feature 'User sign up' do
  scenario 'Successfully' do
    visit root_path
    click_on 'Criar Conta'
    fill_in 'Email', with: 'ze@ig.com.br'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmar senha', with: '12345678'
    attach_file 'Foto', Rails.root.join('spec','support','test.jpg')
    click_on 'Criar conta'
    click_on 'Meu perfil'

    expect(page).to have_css('.avatar')
    expect(page).to have_css('h1', text:'ze@ig.com.br')
    expect(page).not_to have_content('Criar Conta')
  end
end
