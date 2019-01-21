Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes, only: %i[index show new create edit update destroy]
  resources :recipe_types, only: %i[show new create edit update]
  resources :cuisines, only: %i[show new create edit update]
  resources :users, only: %i[show edit update]
  resources :recipes_list, only: %i[show new create]
  get 'all_recipes_list', to: 'recipes_list#all_recipes_list', as: 'all_recipes_list'
  get 'search', to: 'recipes#search', as: 'search'
  get 'spotlight', to: 'recipes#spotlight', as: 'spotlight'
  get 'all_recipes', to: 'recipes#all_recipes', as: 'all_recipes'
  get 'spotlight_recipes', to: 'recipes#spotlight_recipes', as: 'spotlight_recipes'
end
