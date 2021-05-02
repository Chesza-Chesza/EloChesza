Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users

  resources :tournaments do
    resources :rounds
  end

  resources :rounds do
    resources :games
  end
  
  resources :referees
  resources :gameplayers
  resources :players
  resources :homes

  get 'dashboard', to: 'homes#dashboard'
  get 'marce', to: 'homes#marce'
  root 'homes#index'
end
