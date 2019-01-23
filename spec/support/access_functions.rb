def login
    user = create(:user)
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: 'rspec@test'
    click_on 'Entrar'
    user
end

def logout
  click_on 'Sair'
end
