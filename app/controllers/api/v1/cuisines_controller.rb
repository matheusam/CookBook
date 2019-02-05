class Api::V1::CuisinesController < Api::V1::ApiController
  def show
    cuisine = Cuisine.where(id: params[:id]).first
    if cuisine.nil?
      render status: :not_found, json: { msg: 'Cozinha não encontrada' }
    else
      render status: :ok, json: { cuisine: cuisine.name }
    end
  end
end
