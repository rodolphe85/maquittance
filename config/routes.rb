Rails.application.routes.draw do




  root to: 'properties#index'

  resources :landlords

  resources :properties

  resources :tenants

  resources :invoices

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
