require 'rails_helper'
describe 'Api consult cuisine name' do
  it 'Successfully' do
    cuisine = create(:cuisine, name:'foobar')

    get "/api/v1/cuisines/#{cuisine.id}"

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)['cuisine']).to eq(cuisine.name)
  end

  it 'Fails' do
    get '/api/v1/cuisines/1'

    expect(response).to have_http_status(404)
  end
end
