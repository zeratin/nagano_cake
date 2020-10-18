Rails.application.routes.draw do

  namespace :admins do
    get 'homes/top'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers:{
    sessions:'admins/sessions',
    registrations:'admins/registrations',
    passwords:'admins/passwords'
  }

    resources :customers,only: [:index,:show,:edit,:update]
  	  resources :items,only: [:index,:new,:create,:show,:edit,:update,]
  	  get 'top'=>'items#top'
  	  resources :genres,only: [:index,:create,:edit,:update, :show]
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
