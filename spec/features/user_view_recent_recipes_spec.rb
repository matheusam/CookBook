require 'rails_helper'
feature 'User view recent recipes' do
  scenario 'Last six recipes' do
    rapadura = make_recipe(title: 'rapadura')
    marmelada = make_recipe
    goiabada = make_recipe
    bananada = make_recipe
    figada = make_recipe
    laranjada = make_recipe
    doce_leite = make_recipe

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
