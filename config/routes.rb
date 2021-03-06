Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  resources :recipes do
    get 'spotlight', to: 'recipes#spotlight', as: 'spotlight', on: :member
  end
  resources :recipe_types, only: %i[show new create edit update]
  resources :cuisines, only: %i[show new create edit update]
  resources :users, only: %i[show edit update]
  resources :recipe_lists, only: %i[show new create]
  get 'all_recipe_lists', to: 'recipe_lists#all', as: 'all_recipe_lists'
  get 'search', to: 'recipes#search', as: 'search'
  get 'all_recipes', to: 'recipes#all_recipes', as: 'all_recipes'
  namespace 'api', defaults: { format: :json } do
    namespace 'v1' do
      get 'recipes', to: 'recipes#all'
      get 'recipes/:id', to: 'recipes#show'
      get 'cuisines', to: 'cuisines#all'
      get 'cuisines/:id', to: 'cuisines#show'
      get 'recipe_types', to: 'recipe_types#all'
      get 'recipe_types/:id', to: 'recipe_types#show'
      put 'recipes/(.:format)', to: 'recipes#update'
      post 'recipes/new(.:format)', to: 'recipes#create'
      delete 'recipes/(.:format)', to: 'recipes#destroy'
    end
  end
end
