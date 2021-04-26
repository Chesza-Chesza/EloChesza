Rails.application.routes.draw do
  resources :tournaments
  resources :referees
  devise_for :admin_users
  devise_for :users
  resources :homes
  root 'homes#index'
end
