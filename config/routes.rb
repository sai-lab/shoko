Rails.application.routes.draw do
  root to: 'top#index'

  devise_for :users

  resources :documents
  get 'documentes/:id/delete' => 'documentes#delete', as: :delete_document

  resources :templates
  get 'templates/:id/delete' => 'templates#delete', as: :delete_template
  get 'templates/:id/select' => 'templates#select', as: :select_template
end
