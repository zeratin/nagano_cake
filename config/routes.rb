Rails.application.routes.draw do
<<<<<<< HEAD

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> bc248502d2348519f43beb8d5814096b0666745d
    devise_for :admins, controllers:{
      sessions:'admins/sessions',
      registrations:'admins/registrations',
      passwords:'admins/passwords'
    }
<<<<<<< HEAD
  end
  scope module: 'customers' do
=======
    
>>>>>>> bc248502d2348519f43beb8d5814096b0666745d
    devise_for :customers, controllers:{
      sessions:'customers/sessions',
      registrations:'customers/registrations',
      passwords:'customers/passwords'
    }
<<<<<<< HEAD
  end
  
=======


>>>>>>> bc248502d2348519f43beb8d5814096b0666745d
end
