require 'rails_helper'
feature 'User visit users profile' do
  scenario 'Successfully' do
    user = login
    recipe = create(:recipe, user: user)

    visit root_path
    click_on recipe.title
    click_on user.email

    expect(page).to have_css('.avatar')
    expect(page).to have_css('h1', text: user.email)
    expect(page).to have_content(recipe.title)
  end
end
