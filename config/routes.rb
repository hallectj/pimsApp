Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'pages/patient_search' => 'pages#patientSearchPage'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  #let the pass controller do the necessary route directing
  root :to => 'pass#index'
  resources :pages
  resources :patients
    
  #resources :pages do 
    #get 'pages/patient_search', to: 'pages#patientSearchPage', as: :patient_search
  #end
  
  #If a route isn't recognized then let error controller handle it, this needs to be on the last line
  get '*path' => 'error_routes#routing'
end
