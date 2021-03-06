class Recipe < ApplicationRecord
  belongs_to :recipe_type
  belongs_to :cuisine
  belongs_to :user
  # has_many :lists, dependent: :destroy
  # has_many :lists, through: :recipe_lists
  has_one_attached :photo

  validates :title, :recipe_type, :cuisine, :difficulty,
            :cook_time, presence: true

  def cook_time_min
    "#{cook_time} minutos"
  end
end
