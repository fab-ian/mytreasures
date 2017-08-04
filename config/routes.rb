Rails.application.routes.draw do
  devise_for :users

  resources :treasures do
    get 'page/:page', action: :index, on: :collection
  end

  resources :warehouses

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'treasures#index'
end
