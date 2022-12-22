Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in   
  get 'users/index'
  root 'users#index'
  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
        end
      end
    end
  end
end
