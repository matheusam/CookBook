require 'rails_helper'
feature 'User sign in' do
  scenario 'Successfully' do
    user = User.create(email: 'ze1@ig.com', password: '12345678')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '12345678'
    click_on 'Entrar'

    expect(page).to_not have_content('Login')
    expect(page).to have_link('Sair', href:destroy_user_session_path)
    expect(page).to have_css('p',text: "Bem vindo, #{user.email}")

  end
end
