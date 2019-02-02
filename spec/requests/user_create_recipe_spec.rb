require 'rails_helper'

describe 'API return recipes' do
  it 'Successfully' do
    recipe_type = make_recipe_type
    cuisine = make_cuisine
    user = make_user
    recipe = { title: 'new_recipe', difficulty: 'hard', cook_time: 10,
               ingredients: 'blablabla', cook_method: 'blabla',
               recipe_type_id: recipe_type.id, cuisine_id: cuisine.id, user_id: user.id }

    post "/api/v1/recipes/new/", params: recipe

    expect(response).to have_http_status(201)
  end

  it 'Fail' do
    recipe = { title: 'new_recipe' }

    post "/api/v1/recipes/new/", params: recipe

    expect(response).to have_http_status(412)
    expect(JSON.parse(response.body)['msg']).to eq('Não foi possível cadastrar a receita')
  end
end
