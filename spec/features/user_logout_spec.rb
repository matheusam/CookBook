require 'rails_helper'
feature 'User Logout' do
  scenario 'Successfully' do
    user = login
    logout

    expect(page).to have_content('Login')
    expect(page).to have_content('Criar Conta')
    expect(page).not_to have_link('Sair', href: destroy_user_session_path)
    expect(page).not_to have_content(user.email)
  end
end
