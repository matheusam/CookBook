class Api::V1::RecipeTypesController < Api::V1::ApiController
  def show
    recipe_type = RecipeType.where(id: params[:id]).first
    if recipe_type.nil?
      render status: :not_found, json: { msg: 'Tipo de receita não encontrada' }
    else
      render status: :ok, json: { recipe_type: recipe_type.name }
    end
  end
end
