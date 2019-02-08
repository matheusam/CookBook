require 'rails_helper'

describe 'API return recipe types' do
  it 'Successfully' do
    recipe_type = create(:recipe_type, title: 'recipe_type')
    other_recipe_type = create(:recipe_type, title: 'other_recipe_type')
    get '/api/v1/recipe_types'

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)[0]['title']).to eq(recipe_type.title)
    expect(JSON.parse(response.body)[1]['title']).to eq(other_recipe_type.title)
  end

  it 'Fail' do
    get '/api/v1/recipe_types'

    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['msg']).to eq('Nenhuma receita cadastrada')
  end
end
