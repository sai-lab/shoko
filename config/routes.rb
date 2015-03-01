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
end
