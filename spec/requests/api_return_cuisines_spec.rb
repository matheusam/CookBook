require 'rails_helper'

describe 'API return cuisines' do
  it 'Successfully' do
    cuisine = create(:cuisine, name: 'cuisine')
    other_cuisine = create(:cuisine, name: 'other_cuisine')
    get '/api/v1/cuisines'

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)[0]['name']).to eq(cuisine.name)
    expect(JSON.parse(response.body)[1]['name']).to eq(other_cuisine.name)
  end

  it 'Fail' do
    get '/api/v1/cuisines'

    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['msg']).to eq('Nenhuma cozinha cadastrada')
  end
end
