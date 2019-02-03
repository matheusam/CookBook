class RecipeType < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates :name, presence: { message: 'Você deve informar o tipo de receita' }
  validates :name, uniqueness: { case_sensitive: false,
                                 message: 'Esse tipo de receita já existe!' }
end
