Rails.application.routes.draw do
  devise_for :accounts

  get '/dashboard', to: 'accounts#index'
  get '/profile/:username', to: 'accounts#show', as: :profile
  root to: 'home#index'
  resources :posts, only: %i[new show create]
end
