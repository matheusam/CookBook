require 'rails_helper'

feature 'User register recipe' do
  scenario 'successfully' do
    create(:recipe_type, name: 'Sobremesa')
    create(:recipe_type, name: 'Entrada')
    create(:cuisine, name: 'Arabe')
    user = login
    file_name = 'test.jpg'

    click_on 'Enviar uma receita'
    fill_in 'Título', with: 'Tabule'
    select 'Entrada', from: 'Tipo da Receita'
    select 'Arabe', from: 'Cozinha'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: 'Trigo para quibe, cebola, tomate picado, '\
                                  'azeite, salsinha'
    fill_in 'Como Preparar', with: 'Misturar tudo e servir. Adicione limão a '\
                                   'gosto.'
    attach_file 'Foto', Rails.root.join('spec', 'support', file_name)
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Tabule')
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: 'Entrada')
    expect(page).to have_css('p', text: 'Arabe')
    expect(page).to have_css('p', text: 'Fácil')
    expect(page).to have_css('p', text: '45 minutos')
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: 'Trigo para quibe, cebola, tomate '\
                                        'picado, azeite, salsinha')
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: 'Misturar tudo e servir. Adicione '\
                                        'limão a gosto.')
    expect(page).to have_css('h3', text: 'Autor da receita')
    expect(page).to have_css('p', text: user.email)
    expect(page).to have_css("img[src*='#{file_name}']")
  end

  scenario 'and must fill in all fields' do
    login

    click_on 'Enviar uma receita'
    fill_in 'Título', with: ''
    fill_in 'Dificuldade', with: ''
    fill_in 'Tempo de Preparo', with: ''
    fill_in 'Ingredientes', with: ''
    fill_in 'Como Preparar', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar todos os dados da receita')
  end

  scenario 'Non authed user' do
    visit root_path
    expect(page).not_to have_css('li', text: 'Enviar uma receita')
    expect(page).to have_content('Login')
    expect(page).to have_content('Criar Conta')
  end
end
