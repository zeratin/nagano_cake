Rails.application.routes.draw do


  root 'homes#top'
  get 'home/about' => 'homes#about'


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




  resources :items
  resources :carts
  resources :orders
  resources :addresses
  post 'addresses/create' => 'addresses#index'
  patch 'addresses/update' => 'addresses#index'

  resources :customers, only: [:show, :edit, :update] do
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw'
  end
  get 'customer/get' => 'customers#show'
  patch 'customer/update' => 'customers#show'
  resources :addresses

end
