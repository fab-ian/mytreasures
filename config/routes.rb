Rails.application.routes.draw do
  devise_for :users

  resources :treasures

  authenticate :user do
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'treasures#index'
end
