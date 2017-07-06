Rails.application.routes.draw do
  devise_for :users

  resources :treasures

  root to: 'treasures#index'
end
