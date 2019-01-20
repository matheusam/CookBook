class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :set_recipe_type, only: %i[index]
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def index
    @recipes = Recipe.last(6)
    @recipe_types = RecipeType.all
  end

  def all_recipes
    @recipes = Recipe.all
    @recipe_types = RecipeType.all
  end

  def show
    if current_user
      @same_user = @recipe.user.email == current_user.email
    else
      @same_user = false
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
    if @recipe.destroy
      flash[:del] = "Receita apagada com sucesso!"
      redirect_to root_path
    else
      flash[:del] = "Erro ao apagar receita!"
      redirect_to root_path
    end
  end

  private

  def set_recipe_type
    @recipe_types = RecipeType.all
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                   :difficulty, :cook_time, :ingredients,
                                   :cook_method, :photo)
  end
end
