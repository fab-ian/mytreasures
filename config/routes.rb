Rails.application.routes.draw do
  devise_for :users

  resources :treasures do
    get 'page/:page', action: :index, on: :collection
  end

  resources :warehouses
  resources :paper_trail_messages, only: :index do
    get 'page/:page', action: :index, on: :collection
  end

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'treasures#index'
end
