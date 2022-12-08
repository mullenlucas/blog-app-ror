Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users/show'
  get 'users/index'
  root 'users#index'
  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
