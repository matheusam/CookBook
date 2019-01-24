class DropRecipeListRecipeRecipeList < ActiveRecord::Migration[5.2]
  def change
    drop_table :recipe_lists
    drop_table :recipelists_recipes
  end
end
