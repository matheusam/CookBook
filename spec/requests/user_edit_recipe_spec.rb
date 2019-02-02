require 'rails_helper'
describe 'User edit recipe' do
  it 'Successfully' do
    recipe = create(:recipe)
    update = { id: recipe.id, title: 'recipe', difficulty: 'low', cook_time: 10,
               ingredients: 'blablabla', cook_method: 'blabla', user: recipe.user.id }
    put '/api/v1/recipes/', params: update

    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)['msg']).to eq('Receita atualizada com sucesso')
  end

  it 'Other user' do
    recipe = create(:recipe)
    update = { id: recipe.id, title: 'recipe', difficulty: 'low', cook_time: 10,
               ingredients: 'blablabla', cook_method: 'blabla', user: 312 }
    put '/api/v1/recipes/', params: update

    expect(response).to have_http_status(403)
    expect(JSON.parse(response.body)['msg']).to eq('Usuário não confere')
  end

  it 'Fails' do
    update = { id: 1, title: 'recipe', difficulty: 'low', cook_time: 10,
               ingredients: 'blablabla', cook_method: 'blabla', user: 1 }
    put '/api/v1/recipes/', params: update

    expect(response).to have_http_status(404)
    expect(JSON.parse(response.body)['msg']).to eq('Erro ao processar solicitação')
  end
end
