FactoryBot.define do
  factory :recipe do
    title FFaker::Food.meat
    recipe_type
    cuisine
    difficulty %w[Fácil Médio Difícil].sample
    cook_time rand(120)
    ingredients FFaker::Food.ingredient
    cook_method FFaker::Lorem.phrase
    user
  end
end
