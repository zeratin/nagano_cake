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

  devise_for :customers, controllers:{
    sessions:'customers/sessions',
    registrations:'customers/registrations',
    passwords:'customers/passwords'
  }

end
