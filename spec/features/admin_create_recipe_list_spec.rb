require 'rails_helper'
feature 'Admin create recipe list' do
  scenario 'successfully' do
    pending
    login
    goiabada = make_recipe(title: 'Goiabada')
    romeu_julieta = make_recipe(title: 'Romeu e julieta')
    marmelada = make_recipe(title: 'Marmelada')

    visit root_path
    click_on 'Ver listas de receitas'
    click_on 'Nova lista de receitas'
    fill_in 'Nome da lista:', with: 'Receitas de goiaba'
    page.check(goiabada.title)
    page.check(romeu_julieta.title)
    click_on 'Criar'
    visit root_path
    click_on 'Ver listas de receitas'
    click_on 'Nova lista de receitas'
    fill_in 'Nome da lista:', with: 'Mineiras'
    page.check(goiabada.title)
    page.check(marmelada.title)
    click_on 'Criar'
    visit root_path
    click_on 'Ver listas de receitas'

    expect(page).to have_css('li', text: 'Listas de receitas')
    expect(page).to have_css('li', text: 'Receitas de goiaba')
    expect(page).to have_css('li', text: 'Mineiras')
    expect(page).to have_css('li', text: goiabada.title)
    expect(page).to have_css('li', text: 'Receitas de goiaba')
    expect(page).to have_css('li', text: romeu_julieta.title)
  end
end
