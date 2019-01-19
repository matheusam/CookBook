class RecipesListController < ApplicationController
  before_action :set_recipe, only: %i[show new create]

  def show

  end

  def new
    @recipes_list = RecipeList.new
  end

  def create

  end

  private

  def set_recipe
    @recipes = Recipe.all
  end
end
