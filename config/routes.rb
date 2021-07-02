Rails.application.routes.draw do
  # get 'friends/index'
  resources :friends
  root to: 'friends#index'
  resources :blogs
end
