Rails.application.routes.draw do
  get 'pages/patient_search' => 'pages#patientSearchPage'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root :to => 'pass#index'
  resources :pages
  
  #authenticated :user do
      #root :to => 'pages#patientSearchPage', as: :authenticated_root
      #root :to => 'pages#index', as: :admin_root
  #end
  #root :to => 'pages#index'
  
  
  
  
  
  
  
  #resources :pages do 
    #get 'pages/patient_search', to: 'pages#patientSearchPage', as: :patient_search
  #end
  
 

  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
