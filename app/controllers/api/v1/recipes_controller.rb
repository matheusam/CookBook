class Api::V1::RecipesController < Api::V1::ApiController
  def all
    recipes = Recipe.all
    if recipes.any?
      render status: :ok, json: recipes
    else
      render status: :not_found, json: { msg: 'Nenhuma receita cadastrada' }
    end
  end

  def show
    begin
      recipe = set_recipe
      render status: :ok, json: recipe
    rescue
      render status: :not_found, json: { msg: 'Nenhuma receita encontrada' }
    end
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      render status: :created, json: recipe
    else
      render status: :precondition_failed, json: { msg: 'Não foi possível cadastrar a receita' }
    end
  end

  def destroy
    begin
      recipe = set_recipe
      if recipe.user.id.to_s == params[:user]
        recipe.destroy
        render status: :ok, json: { msg: 'Receita apagada com sucesso' }
      else
        render status: :precondition_failed, json: { msg: 'Usuário não confere' }
      end
    rescue
      render status: :not_found, json: { msg: 'Erro ao processar solicitação' }
    end
  end

  def update
    begin
      recipe = set_recipe
      if recipe.user.id.to_s == params[:user]
        recipe.update(recipe_params)
        render status: :ok, json: { msg: 'Receita atualizada com sucesso' }
      else
        render status: :forbidden, json: { msg: 'Usuário não confere' }
      end
    rescue
      render status: :not_found, json: { msg: 'Erro ao processar solicitação' }
    end
  end

  private

  def set_recipe
    Recipe.find(params[:id])
  end

  def recipe_params
    params.permit(%i[title recipe_type_id cuisine_id difficulty cook_time
                     ingredients cook_method user_id])
    # photo spotlight])
  end
end
