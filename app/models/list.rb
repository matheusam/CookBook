class List < ApplicationRecord
  has_many :recipes
  has_many :recipes, through: :recipe_lists
end
