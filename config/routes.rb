Rails.application.routes.draw do
  scope '/admin' do
    resources :users, except: %i(edit update show)
  end

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
