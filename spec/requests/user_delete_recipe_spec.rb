require 'rails_helper'
describe 'User delete recipe' do
  it 'Successfully' do
    recipe = create(:recipe, title: 'recipe')
    param = { id: recipe.id, user: recipe.user.id }

    delete "/api/v1/recipes/", params: param

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)['msg']).to eq('Receita apagada com sucesso')
  end

  it 'Fails 404' do
    delete "/api/v1/recipes/", params: { id: '12312123' }

    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['msg']).to eq('Erro ao processar solicitação')
  end

  it 'Fails 412' do
    recipe = create(:recipe, title: 'recipe')
    param = { id: recipe.id }

    delete "/api/v1/recipes/", params: param

    expect(response).to have_http_status(412)
    expect(JSON.parse(response.body)['msg']).to eq('Usuário não confere')
  end

end
