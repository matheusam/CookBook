require 'rails_helper'
feature 'User sign in' do
  scenario 'Successfully' do
    user = login

    expect(page).to have_link('Sair', href: destroy_user_session_path)
    expect(page).to have_css('p', text: "Bem vindo, #{user.email}")
    expect(page).to_not have_link('Login')
  end
end
