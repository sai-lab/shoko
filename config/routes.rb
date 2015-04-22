Rails.application.routes.draw do
  root to: 'top#index'

  devise_for :users

  resources :documents do
    get :delete, on: :member
  end

  resources :templates do
    get :delete, on: :member
    get :select, on: :member
  end

  resources :pictures, only: [:create]

  resources :record, only: [:index]

  namespace :admin do
    resources :users do
      get :delete, on: :member
    end

    resources :documents, only: [:show]

    resources :pictures, only: [:index, :show, :destroy] do
      get :delete, on: :member
    end

    resources :web_hooks, except: [:show] do
      get :delete, on: :member
    end

    resources :sidekiq, only: %w( index )
  end

  authenticate :user, lambda { |u| u.is_admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
