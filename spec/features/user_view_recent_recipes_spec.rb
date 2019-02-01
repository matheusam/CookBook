require 'rails_helper'
feature 'User view recent recipes' do
  scenario 'Last six recipes' do
    rapadura = make_recipe(title: 'rapadura')
    marmelada = make_recipe(title: 'laranha')
    goiabada = make_recipe(title: 'maça')
    bananada = make_recipe(title: 'coconut')
    figada = make_recipe(title: 'amora')
    laranjada = make_recipe(title: 'abacate')
    doce_leite = make_recipe(title: 'foobar')

    visit root_path

    expect(page).to have_css('h1', text: doce_leite.title)
    expect(page).to have_css('h1', text: laranjada.title)
    expect(page).to have_css('h1', text: figada.title)
    expect(page).to have_css('h1', text: bananada.title)
    expect(page).to have_css('h1', text: goiabada.title)
    expect(page).to have_css('h1', text: marmelada.title)
    expect(page).not_to have_css('h1', text: rapadura.title)
  end
end
