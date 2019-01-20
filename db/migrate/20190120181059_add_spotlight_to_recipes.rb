class AddSpotlightToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :spotlight, :boolean
  end
end
