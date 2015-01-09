Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users
end
