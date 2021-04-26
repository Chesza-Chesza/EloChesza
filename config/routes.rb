Rails.application.routes.draw do
  resources :rounds
  resources :players
  resources :tournaments
  resources :referees
  devise_for :admin_users
  devise_for :users
  resources :homes
  root 'homes#index'
end
