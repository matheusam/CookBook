class RecipesListController < ApplicationController
  before_action :set_recipe, only: %i[show new create]

  def show

  end

  def new
    @recipes_list = RecipeList.new
  end

  def create
    @recipes_list = RecipeList.created(recipes_list_params)
  end

  private

  def set_recipe
    @recipes = Recipe.all
  end

  def recipes_list_params
    params.require(:recipes_list).permit(:name, :recipes)
  end
end
