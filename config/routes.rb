Rails.application.routes.draw do
  resources :friendships, only: [:create, :update, :destroy]
  devise_for :users
  get 'users/show'
  root 'users#show'
end
