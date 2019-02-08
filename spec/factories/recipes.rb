FactoryBot.define do
  factory :recipe do
    title { |n| "Prato#{n}test" }
    recipe_type
    cuisine
    difficulty { %w[Fácil Médio Difícil].sample }
    cook_time { 120 }
    ingredients { FFaker::Food.ingredient }
    cook_method { FFaker::Lorem.phrase }
    user
  end
end
