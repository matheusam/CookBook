class Api::V1::RecipeTypesController < Api::V1::ApiController
  def show
    recipe_type = RecipeType.where(id: params[:id]).first
    if recipe_type.nil?
      render status: :not_found, json: { msg: 'Tipo de receita não encontrada' }
    else
      render status: :ok, json: { recipe_type: recipe_type.name }
    end
  end

  def all
    recipe_types = RecipeType.all
    if recipe_types.any?
      render status: :ok, json: recipe_types
    else
      render status: :not_found, json: { msg: 'Nenhum tipo de receita cadastrada' }
    end
  end
end
