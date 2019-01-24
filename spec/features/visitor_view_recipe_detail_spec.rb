require 'rails_helper'

feature 'Visitor view recipe details' do
  scenario 'successfully' do
    login
    recipe = make_recipe

    visit root_path
    click_on recipe.title

    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: recipe.recipe_type.name)
    expect(page).to have_css('p', text: recipe.cuisine.name)
    expect(page).to have_css('p', text: recipe.difficulty)
    expect(page).to have_css('p', text: "#{recipe.cook_time} minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: recipe.ingredients)
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: recipe.cook_method)
  end

  scenario 'and return to recipe list' do
    login
    recipe = make_recipe

    visit root_path
    click_on recipe.title
    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end

  scenario 'non authed user cant delete or edit' do
    login
    recipe = make_recipe

    visit root_path
    logout
    click_on recipe.title

    expect(page).not_to have_css('a', text: 'Editar')
    expect(page).not_to have_css('a', text: 'Deletar')
  end

  scenario 'only authed user owner can delete or edit' do
    user = login
    recipe = create(:recipe, user: user)

    visit root_path
    click_on recipe.title

    expect(page).to have_css('a', text: 'Editar')
    expect(page).to have_css('a', text: 'Deletar')

    logout
    other_user = create(:user, email: 'outro@email.com')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: other_user.email
    fill_in 'Senha', with: 'rspec@test'
    click_on 'Entrar'
    visit root_path
    click_on recipe.title

    expect(page).not_to have_css('a.btn:nth-child(14)', text: 'Editar')
    expect(page).not_to have_css('a.btn:nth-child(15)', text: 'Deletar')
  end
end
