require 'rails_helper'
feature 'Admin spotlight a recipe' do
  scenario 'Successfully' do
    user = login
    recipe = create(:recipe, user: user)

    visit root_path
    click_on recipe.title
    click_on 'Marcar como destaque'

    expect(page).to have_css('.spotlight')
    visit root_path
    expect(page).to have_css('.spotlight')
  end
end
