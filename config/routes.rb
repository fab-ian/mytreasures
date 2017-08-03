Rails.application.routes.draw do
  devise_for :users

  resources :treasures
  resources :warehouses

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'treasures#index'
end
