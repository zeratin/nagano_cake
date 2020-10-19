Rails.application.routes.draw do
<<<<<<< HEAD
  
  root 'homes#top'
  get 'home/about' => 'homes#about'
=======
>>>>>>> 7759046e1d5e31b1326a64b7ae85a6591bad8f5b

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
<<<<<<< HEAD
    
      
  
  resources :items
  resources :carts
  resources :orders
  resources :addresses
  post 'addresses/create' => 'addresses#index'
  patch 'addresses/update' => 'addresses#index'
=======

  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :items
  resources :carts
  resources :orders
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw] do
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
  end
  get 'customer/get' => 'customers#show'
  patch 'customer/update' => 'customers#show'
  resources :addresses
>>>>>>> 7759046e1d5e31b1326a64b7ae85a6591bad8f5b
end
