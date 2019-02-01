class CreateRecipeLists < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_lists do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :list, index: true
      t.timestamps
    end
  end
end
