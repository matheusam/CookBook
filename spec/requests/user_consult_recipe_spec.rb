require 'rails_helper'
describe 'User consult recipe' do
  it 'Successfully' do
    recipe = create(:recipe, title: 'recipe')

    get "/api/v1/recipes/#{recipe.id}"

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)['title']).to eq(recipe.title)
  end

  it 'fails' do
    get '/api/v1/recipes/6578'

    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['msg']).to eq('Nenhuma receita encontrada')
  end
end
