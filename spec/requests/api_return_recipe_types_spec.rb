require 'rails_helper'

describe 'API return recipe types' do
  it 'Successfully' do
    recipe_type = create(:recipe_type, name: 'recipe_type')
    other_recipe_type = create(:recipe_type, name: 'other_recipe_type')
    get '/api/v1/recipe_types'

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)[0]['name']).to eq(recipe_type.name)
    expect(JSON.parse(response.body)[1]['name']).to eq(other_recipe_type.name)
  end

  it 'Fail' do
    get '/api/v1/recipe_types'

    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['msg']).to eq('Nenhum tipo de receita cadastrada')
  end
end
