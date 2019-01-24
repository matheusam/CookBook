require 'rails_helper'
feature 'User delete recipe' do
  scenario 'successfully' do
    user = login
    marmelada = create(:recipe, title: 'Marmelada', user: user)

    visit root_path
    click_on marmelada.title
    click_on 'Deletar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Receita apagada com sucesso!')
    expect(page).not_to have_css('h1', text: marmelada.title)
  end

  scenario 'Only owner delete recipes' do
    user = login
    recipe = create(:recipe, title: 'Marmelada', user: user)

    visit root_path
    logout

    other_user = create(:user, email: 'outro@email')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: other_user.email
    fill_in 'Senha', with: 'rspec@test'
    click_on 'Entrar'
    visit root_path
    click_on recipe.title

    expect(page).not_to have_link('Deletar')
  end
end
