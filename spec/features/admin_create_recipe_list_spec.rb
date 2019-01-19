require 'rails_helper'
feature 'Admin create recipe list' do
  scenario 'successfully' do
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    user = User.create(email: 'ze1@ig.com', password: '12345678')

    # simula a ação do usuário
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: '12345678'
    click_on 'Entrar'

    goiabada = Recipe.create(title: 'goiabada', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'goiaba',
                           cook_method: 'Cozinhe a goiaba',
                           user: user)
   romeu_julieta = Recipe.create(title: 'romeu e julieta', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'goiaba e queijo',
                          cook_method: 'Coloque a goiaba no queijo',
                          user: user)
   marmelada = Recipe.create(title: 'marmelo', recipe_type: recipe_type,
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'marmelo',
                          cook_method: 'Cozinhe a goiaba',
                          user: user)

    visit root_path
    click_on 'Criar lista de receitas'
    fill_in 'Nome da lista:', with: 'Receitas de goiaba'
    page.check('goiabada')
    page.check('romeu e julieta')
    click_on 'Criar'
    visit root_path
    click_on 'Criar lista de receitas'
    fill_in 'Nome da lista:', with: 'Mineiras'
    page.check('goiabada')
    page.check('marmelada')
    click_on 'Criar'
    visit root_path

    click_on 'Listas de receitas'
    expect(page).to have_css('h1', text:'Listas de receitas')
    expect(page).to have_css('h1', text:'Receitas de goiaba')
    expect(page).to have_css('h1', text:'Mineiras')
    expect(page).to have_css('h1', text:'goiabada')
    expect(page).to have_css('h1', text:'Receitas de goiaba')
    expect(page).to have_css('h1', text:'romeu e julieta')

  end
end
