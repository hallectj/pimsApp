Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'pages/patient_search' => 'pages#patientSearchPage', as: "search"
  
  get 'pages/doctor' => 'pages#doctorView', as: "doctor"
  get 'pages/medical' => 'pages#medicalView', as: "medical"
  get 'pages/office' => 'pages#officeView', as: "office"
  get 'pages/volunteer' => 'pages#volunteerView', as: "volunteer"
  get 'pages_patient_results' => "pages#pagesPatientResults", as: "pages_patient_results"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  #let the pass controller do the necessary route directing
  root :to => 'pass#index'
  
  #get 'pages/:id/edit/edit_patient', to: 'pages#edit_patient', as: :edit_patient
  #put '/pages/:id/updatePatient', to: 'pages#updatePatient', as: :updatePatient
  #get '/pages/new/newPatient', to: 'pages#newPatient', as: :newPatient
  
  
  #resources :pages
  
  
  resources :pages do
    member do
      #custom new
      get :new_patient
    end
  end
  
  #PATIENT CUSTOM ROUTES EDIT UPDATE
  get '/pages/:id/edit/edit_patient', to: 'pages#edit_patient', as: :edit_patient
  
  match "pages/:id/update/update_patient" => "pages#update_patient", as: :update_patient, via: [:patch, :post]
  
  #patch '/pages/:id/update/update_patient', to: 'pages#update_patient', as: :update_patient
  #post '/pages/:id/update/update_patient', to: 'pages#update_patient', as: :update_patient
    
  
  #resources :pages do 
    #get 'pages/patient_search', to: 'pages#patientSearchPage', as: :patient_search
  #end
  
  #If a route isn't recognized then let error controller handle it, this needs to be on the last line
  get '*path' => 'error_routes#routing'
end
