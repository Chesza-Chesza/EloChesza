Rails.application.routes.draw do
  resources :gameplayers
  resources :games
  resources :rounds
  resources :players
  resources :tournaments
  resources :referees
  devise_for :admin_users
  devise_for :users
  resources :homes

  get 'dashboard', to: 'homes#dashboard'
  root 'homes#index'
end
