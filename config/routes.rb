Rails.application.routes.draw do
  
  root 'pages#index'
  resources :pages
  
  #resources :pages do 
    #get 'pages/patient_search', to: 'pages#patientSearchPage', as: :patient_search
  #end

  get 'pages/patient_search' => 'pages#patientSearchPage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
