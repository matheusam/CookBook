Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes, only: %i[index show new create edit update destroy]
  resources :recipe_types, only: %i[show new create]
  resources :cuisines, only: %i[show new create]
  resources :users, only: %i[show edit update]
  resources :recipes_list, only: %i[show new create]
  get 'search', to: 'recipes#search', as: 'search'
  get 'all_recipes', to: 'recipes#all_recipes', as: 'all_recipes'
end
