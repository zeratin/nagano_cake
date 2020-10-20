Rails.application.routes.draw do
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


  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :items
  resources :carts
  resources :orders
  resources :addresses
  post 'addresses/create' => 'addresses#index'
  patch 'addresses/update' => 'addresses#index'
  resources :genres,only: [:index,:create,:edit,:update, :show] do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end

  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw] do
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
  end
  get 'customer/get' => 'customers#show'
  patch 'customer/update' => 'customers#show'

end
