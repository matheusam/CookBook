class RecipeListsController < ApplicationController
  before_action :set_recipes, only: %i[show all new]

  def show; end

  def new
    @recipes_list = RecipeList.new
  end

  def create
    #byebug
    @recipes_list = List.recipes.new(name: params[:name], recipes: params[:recipes])
    if @recipes_list.save
      redirect_to @recipes_list
    else
      render :new
    end
  end

  def all; end

  private

  def set_recipes
    @recipes = Recipe.all
  end

  def recipes_list_params
    params.require(:recipe_lists).permit(:name, :recipes)
  end
end
