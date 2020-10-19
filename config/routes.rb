Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :items
  resources :carts
  resources :orders
  resources :addresses
  post 'addresses/create' => 'addresses#index'
  patch 'addresses/update' => 'addresses#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_for :admins, controllers:{
      sessions:'admins/sessions',
      registrations:'admins/registrations',
      passwords:'admins/passwords'
    }

    devise_for :customers, controllers:{
      sessions:'customers/sessions',
      registrations:'customers/registrations',
      passwords:'customers/passwords'
    }
end
