class CreateJoinTablerRecipeListsRecipe < ActiveRecord::Migration[5.2]
  def change
    create_join_table :recipelists, :recipes do |t|
      # t.index [:recipelist_id, :recipe_id]
      # t.index [:recipe_id, :recipelist_id]
    end
  end
end
