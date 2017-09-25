Rails.application.routes.draw do
  get 'friendships/create'

  get 'friendships/update'

  get 'friendships/destroy'

  devise_for :users
end
