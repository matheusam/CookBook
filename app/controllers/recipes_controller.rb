class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy spotlight]
  before_action :set_recipe_type, only: %i[index]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @recipes = Recipe.last(6)
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def all_recipes
    @recipes = Recipe.all
    @recipe_types = RecipeType.all
  end

  def show
    @same_user = if current_user
                   @recipe.user.email == current_user.email
                 else
                   false
                 end
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def create
    params = recipe_params
    params[:user] = current_user
    @recipe = Recipe.new(params)
    if @recipe.save
      redirect_to @recipe
    else
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
      render :new
    end
  end

  def edit
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
      render :edit
    end
  end

  def search
    @recipes = Recipe.where('title LIKE ?', "%#{params[:search]}%")
  end

  def destroy
    flash[:del] = if @recipe.destroy
                    'Receita apagada com sucesso!'
                  else
                    'Erro ao apagar receita!'
                  end
    redirect_to root_path
  end

  def spotlight
    @recipe.update(spotlight: true)
    redirect_to @recipe
  end

  private

  def set_recipe_type
    @recipe_types = RecipeType.all
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(%i[title recipe_type_id cuisine_id
                                      difficulty cook_time ingredients
                                      cook_method photo spotlight])
  end
end
