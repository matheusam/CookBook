Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes, only: %i[index show new create edit update destroy]
  resources :recipe_types, only: %i[show new create]
  resources :cuisines, only: %i[show new create]
  get 'search', to: 'recipes#search', as: 'search'
end
