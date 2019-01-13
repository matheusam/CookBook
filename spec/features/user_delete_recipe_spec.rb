require 'rails_helper'
feature 'User delete recipe' do
  scenario 'successfully',login:true do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    marmelada = Recipe.create(title: 'Marmelada', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'fácil',
                           cook_time: 10,
                           ingredients: 'Marmelo',
                           cook_method: 'Cozinhe o marmelo no fogo',
                           user: @user)

    visit root_path
    click_on  marmelada.title
    click_on 'Deletar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Receita apagada com sucesso!')
    expect(page).not_to have_css('h1', text:marmelada.title)
  end

  # scenario 'Only owner delete recipes',login:true do
  #   recipe_type = RecipeType.create(name: 'Sobremesa')
  #   cuisine = Cuisine.create(name: 'Brasileira')
  #   recipe = Recipe.create(title: 'Marmelada', recipe_type: recipe_type,
  #                          cuisine: cuisine, difficulty: 'fácil',
  #                          cook_time: 10,
  #                          ingredients: 'Marmelo',
  #                          cook_method: 'Cozinhe o marmelo no fogo',
  #                          user: @user)
  #
  #   visit root_path
  #   click_on 'Sair'
  #
  #   other_user = User.create(email:'outro@email',
  #               password:'outro@email')
  #
  #   visit root_path
  #   click_on 'Login'
  #   fill_in 'Email', with: other_user.email
  #   fill_in 'Senha', with: 'outro@email'
  #   click_on 'Entrar'
  ##erro 
  #   get "/recipes/#{recipe.id}", method: delete
  #
  #   expect(current_path).to eq root_path
  #   expect(page).not_to have_content('Receita apagada com sucesso!')
  #   expect(page).to have_css('h1', text:marmelada.title)
  # end
end
