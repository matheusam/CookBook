class RecipesListController < ApplicationController
  before_action :set_recipes, only: %i[show all_recipes_list new create]

  def show; end

  def new
    @recipes_list = RecipeList.new
  end

  def create
    @recipes_list = RecipeList.new(recipes_list_params)
    if @recipes_list.save
      redirect_to @recipes_list
    else
      render :new
    end
  end

  def all_recipes_list; end

  private

  def set_recipes
    @recipes = Recipe.all
  end

  def recipes_list_params
    params.require(:recipes_list).permit(:name, :recipes)
  end
end
