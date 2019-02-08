require 'rails_helper'
describe 'Api consult recipe type name' do
  it 'Successfully' do
    recipe_type = create(:recipe_type, name: 'foobar')

    get "/api/v1/recipe_types/#{recipe_type.id}"

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)['recipe_type']).to eq(recipe_type.name)
  end

  it 'Fails' do
    get '/api/v1/recipe_types/1'

    expect(response).to have_http_status(404)
  end
end
