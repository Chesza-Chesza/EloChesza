Rails.application.routes.draw do
  devise_for :users
  resources :homes
  root 'homes#index'
end
