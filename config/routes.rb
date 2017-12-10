Rails.application.routes.draw do



  root to: 'landlords#index'

  resources :landlords do
      resources :properties
  end

  resources :tenants

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
