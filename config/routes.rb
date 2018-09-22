Rails.application.routes.draw do
  
  #devise_for :users
  root 'pages#index'
  resources :pages
  
  #resources :pages do 
    #get 'pages/patient_search', to: 'pages#patientSearchPage', as: :patient_search
  #end
  
 
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  

  get 'pages/patient_search' => 'pages#patientSearchPage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
