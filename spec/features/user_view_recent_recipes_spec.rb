require 'rails_helper'
feature 'User view recent recipes' do
  scenario 'Last six recipes' do
    rapadura = create(:recipe, title: 'rapadura')
    marmelada = create(:recipe, title: 'marmelada')
    goiabada = create(:recipe, title: 'goiabada')
    bananada = create(:recipe, title: 'bananada')
    figada = create(:recipe, title: 'figada')
    laranjada = create(:recipe, title: 'laranjada')
    doce_leite = create(:recipe, title: 'doce_leite')

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
