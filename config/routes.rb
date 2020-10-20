Rails.application.routes.draw do

  # 以下管理者側設定
  devise_for :admins, controllers:{
    sessions:'admins/sessions',
    registrations:'admins/registrations',
    passwords:'admins/passwords'
  }


  namespace :admins do
    get 'homes/top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show]
    patch 'orders/:id' => 'orders#status_update'
  end
  # 管理者側設定ここまで

  resources :customers,only: [:index,:show,:edit,:update]
  resources :items,only: [:index,:new,:create,:show,:edit,:update]
  get 'top'=>'items#top'
  resources :orders,only: [:index,:show,:update] do
    member do
      get :current_index
      resource :order_details,only: [:update]
    end
    collection do
      get :today_order_index
    end
  end

  scope module: 'customers' do
    devise_for :customers, controllers:{
      sessions:'customers/sessions',
      registrations:'customers/registrations',
      passwords:'customers/passwords'
    }
  end


  end

end
