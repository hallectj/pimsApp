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
  resources :pages
  
  #PATIENT CUSTOM ROUTES EDIT UPDATE
    get '/pages/:id/edit/edit_patient', to: 'pages#edit_patient', as: :edit_patient
    match "pages/:id/update/update_patient" => "pages#update_patient", as: :update_patient, via: [:patch, :post]

    get '/pages/:id/edit/edit_admittance', to: 'pages#edit_admittance', as: :edit_admittance
    match "pages/:id/update/update_admittance" => "pages#update_admittance", as: :update_admittance, via: [:patch, :post]

    get '/pages/:id/edit/edit_discharge', to: 'pages#edit_discharge', as: :edit_discharge
    match "pages/:id/update/update_discharge" => "pages#update_discharge", as: :update_discharge, via: [:patch, :post]

    get '/pages/:id/discharge/:id/edit/edit_bill', to: 'pages#edit_bill', as: :edit_bill
    match "pages/:id/discharge/:id/update/update_bill" => "pages#update_bill", as: :update_bill, via: [:patch, :post]

    get '/pages/:id/edit/edit_contact', to: 'pages#edit_contact', as: :edit_contact
    match "pages/:id/update/update_contact" => "pages#update_contact", as: :update_contact, via: [:patch, :post]

    get '/pages/:id/edit/edit_physician', to: 'pages#edit_physician', as: :edit_physician
    match "pages/:id/update/update_physician" => "pages#update_physician", as: :update_physician, via: [:patch, :post]

    get '/pages/:id/edit/edit_location', to: 'pages#edit_location', as: :edit_location
    match "pages/:id/update/update_location" => "pages#update_location", as: :update_location, via: [:patch, :post]

    get '/pages/:id/edit/edit_emergency_contact', to: 'pages#edit_emergency_contact', as: :edit_emergency_contact
    match "pages/:id/update/update_emergency_contact" => "pages#update_emergency_contact", as: :update_emergency_contact, via: [:patch, :post]

    get '/pages/:id/edit/edit_insurance', to: 'pages#edit_insurance', as: :edit_insurance
    match "pages/:id/update/update_insurance" => "pages#update_insurance", as: :update_insurance, via: [:patch, :post]

    #Adding new records
  
    get '/patient/:id/new_physician', to: 'pages#new_physician', as: :create_physician
    match "/patient/:id/new_physician" => "pages#create_physician", as: :new_physician, :via => [:patch, :post]

    get '/patient/:id/new_location', to: 'pages#new_location', as: :create_location
    match "/patient/:id/new_location" => "pages#create_location", as: :new_location, :via => [:patch, :post]

    get '/patient/:id/new_insurance', to: 'pages#new_insurance', as: :create_insurance
    match "/patient/:id/new_insurance" => "pages#create_insurance", as: :new_insurance, :via => [:patch, :post]

    get '/patient/:id/new_emergency_contact', to: 'pages#new_emergency_contact', as: :create_emergency_contact
    match "/patient/:id/new_emergency_contact" => "pages#create_emergency_contact", as: :new_emergency_contact, :via => [:patch, :post]

    get '/patient/:id/new_contact', to: 'pages#new_contact', as: :create_contact
    match "/patient/:id/new_contact" => "pages#create_contact", as: :new_contact, :via => [:patch, :post]

    get '/patient/:id/new_discharge', to: 'pages#new_discharge', as: :create_discharge
    match "/patient/:id/new_discharge" => "pages#create_discharge", as: :new_discharge, :via => [:patch, :post]

    get '/patient/:id/new_treatment', to: 'pages#new_treatment', as: :create_treatment
    match "/patient/:id/new_treatment" => "pages#create_treatment", as: :new_treatment, :via => [:patch, :post]

    
    get '/pages/:id/treatment/:id/new_schedule', to: 'pages#new_schedule', as: :new_schedule
    get '/pages/:id/treatment/:id/create/create_schedule', to: 'pages#create_schedule'
    match "/pages/:id/treatment/:id/create/create_schedule" => "pages#create_schedule", :via => :post, :as => :create_schedule
    
    get '/pages/:id/treatment/:id/new_prescription', to: 'pages#new_prescription', as: :new_prescription
    get '/pages/:id/treatment/:id/create/create_prescription', to: 'pages#create_prescription'
    match "/pages/:id/treatment/:id/create/create_prescription" => "pages#create_prescription", :via => :post, :as => :create_prescription
    
    get '/pages/:id/treatment/:id/new_dr_note', to: 'pages#new_dr_note', as: :new_dr_note
    get '/pages/:id/treatment/:id/create/create_dr_note', to: 'pages#create_dr_note'
    match "/pages/:id/treatment/:id/create/create_dr_note" => "pages#create_dr_note", :via => :post, :as => :create_dr_note
    
  #If a route isn't recognized then let error controller handle it, this needs to be on the last line
  #get '*path' => 'error_routes#routing'
end
