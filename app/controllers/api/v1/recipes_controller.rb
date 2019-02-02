class Api::V1::RecipesController < Api::V1::ApiController

  def all
    recipes = Recipe.all
    if recipes.any?
      render status: 200, json: recipes
    else
      render status: 404, json: { msg: 'Nenhuma receita cadastrada' }
    end
  end

  def show
    begin
      recipe = set_recipe
      render status: 200, json: recipe
    rescue
      render status: 404, json: { msg: 'Nenhuma receita encontrada' }
    end
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      render status: 201, json: recipe
    else
      render status: 412, json: { msg: 'Não foi possível cadastrar a receita' }
    end
  end

  def destroy
    begin
      recipe = set_recipe
      if recipe.user.id.to_s == params[:user]
        recipe.destroy
        render status: 200, json: { msg: 'Receita apagada com sucesso' }
      else
        render status: 412, json: { msg: 'Usuário não confere' }
      end
    rescue
      render status: 404, json: { msg: 'Erro ao processar solicitação' }
    end
  end

  private

  def set_recipe
    Recipe.find(params[:id])
  end

  def recipe_params
    params.permit(%i[title recipe_type_id cuisine_id
                                      difficulty cook_time ingredients
                                      cook_method user_id])
                                      # photo spotlight])
  end
end
