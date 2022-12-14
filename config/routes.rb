Rails.application.routes.draw do
  # Define your application routes per the DSL in   
  get 'users/index'
  root 'users#index'
  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
end
