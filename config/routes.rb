Rails.application.routes.draw do
  devise_for :accounts

  get '/dashboard', to: 'accounts#index'
  get '/profile/:username', to: 'accounts#show', as: :profile
  get '/post/like/:post_id', to: 'likes#like', as: :like
  post '/follow', to: 'accounts#follow', as: :follow
  root to: 'home#index'
  resources :posts, only: %i[new show create]
end
