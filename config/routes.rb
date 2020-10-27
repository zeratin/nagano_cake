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

  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :create, :destroy, :update]

  resources :addresses
  resources :genres, only: [:index, :create, :show, :edit, :update]
  post 'addresses/create' => 'addresses#index'
  patch 'addresses/update' => 'addresses#index'

  resources :items, only: [:index, :show]

  resources :customers, only: [:index, :show, :edit, :update]
  get '/customers/unsubscribe/:id' => 'customers#unsubscribe', as: 'customer_unsubscribe'
  patch '/customers/withdraw/:id' => 'customers#withdraw', as: 'customer_withdraw'
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
    resources :items,only: [:index,:new,:create,:show,:edit,:update]
    resources :orders, only: [:index, :show]
    patch 'orders/:id' => 'orders#status_update'
  end

  get 'orders/thanks' => 'orders#thanks'
  post 'orders/confirm' => 'orders#confirm'
  post 'orders' => 'orders#create'

  resources :orders, only: [:index, :show, :new, :create, :destroy]
end
