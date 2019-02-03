require 'rails_helper'

describe 'API return recipes' do
  it 'Successfully' do
    recipe = create(:recipe, title: 'recipe')
    other_recipe = create(:recipe, title: 'other_recipe')
    get '/api/v1/recipes'

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)[0]['title']).to eq(recipe.title)
    expect(JSON.parse(response.body)[1]['title']).to eq(other_recipe.title)
  end

  it 'Fail' do
    get '/api/v1/recipes'

    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['msg']).to eq('Nenhuma receita cadastrada')
  end
end
