Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :users

  resources :tournaments do
    resources :rounds

    member do
      post 'upload_data_games', as: 'upload_data_games'
    end
  end

  resources :rounds do
    resources :games
  end

  resources :referees
  resources :gameplayers
  resources :players
  resources :homes
  resources :calculates, only: %i[index create]

  get 'dashboard', to: 'homes#dashboard'
  get 'file', to: 'tournaments#file'
  root 'calculates#index'
end
