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
  end


  get 'orders/confirm' => 'orders#confirm'
  # 注文機能が進み次第confirmのメソッドをpostに変える
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:index, :show, :update, :new, :create] do
    member do
      get :current_index
      resource :order_details, only: [:update]
    end
    collection do
      get :today_order_index
    end

  end

end
