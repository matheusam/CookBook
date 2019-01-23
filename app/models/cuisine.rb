class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: { message: 'Você deve informar o nome da cozinha' }
  validates :name, uniqueness: { case_sensitive: false,
                                 message: 'Essa cozinha já está cadastrada!' }
end
