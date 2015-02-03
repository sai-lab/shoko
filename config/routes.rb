Rails.application.routes.draw do
  root to: 'top#index'

  devise_for :users

  resources :documents
  get 'documentes/:id/delete' => 'documentes#delete', as: :delete_document
end
