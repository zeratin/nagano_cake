Rails.application.routes.draw do


  scope module: 'customers' do
    devise_for :customers, controllers:{
      sessions:'customers/sessions',
      registrations:'customers/registrations',
      passwords:'customers/passwords'
    }
  end


  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :carts
  resources :orders
  resources :addresses
  post 'addresses/create' => 'addresses#index'
  patch 'addresses/update' => 'addresses#index'

  resources :items, only: [:index,:show]

  resources :customers, only: [:index, :show, :edit, :update, :unsubscribe, :withdraw] do
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'
  end
  get 'customer/get' => 'customers#show'
  patch 'customer/update' => 'customers#show'

  devise_for :admins, controllers:{
    sessions:'admins/sessions',
    registrations:'admins/registrations',
    passwords:'admins/passwords'
  }


  namespace :admins do
    get '/' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :show, :edit, :update]
    resources :items, only: [:create, :new, :edit, :update, :show, :index, :destroy ]
    resources :orders, only: [:index, :show]
    patch 'orders/:id' => 'orders#status_update'
  end



  resources :orders, only: [:index,:show,:update] do
    member do
      get :current_index
      resource :order_details, only: [:update]
    end
    collection do
      get :today_order_index
    end
  end

end
