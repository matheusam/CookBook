class Api::V1::RecipesController < Api::V1::ApiController
  def all
    recipes = Recipe.all
    if recipes.any?
      render status: 200, json: recipes
    else
      render status: 404, json: { msg: 'Nenhuma receita cadastrada' }
    end
  end
end
