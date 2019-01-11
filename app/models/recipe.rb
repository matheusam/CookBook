class Recipe < ApplicationRecord
  belongs_to :recipe_type
  belongs_to :cuisine
  has_one :user

  validates :title, :recipe_type, :cuisine, :difficulty,
            :cook_time, presence: true

  def cook_time_min
    "#{cook_time} minutos"
  end
end
