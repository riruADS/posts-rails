Rails.application.routes.draw do
  resources :friendships, only: [:create, :update, :destroy]
  resources :posts, only: [:index, :new, :create]
  devise_for :users
  get 'users/show'
  root 'posts#index'
  
  mount ActionCable.server, at: '/cable'
end
