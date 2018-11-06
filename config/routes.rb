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
  #resources :pages do
    #resources :treatment do 
       #resources :schedules
    #end 
  #end


  #new   /pages/:page_id/treatment/:treatment_id/schedules(.:format)
  #create /pages/:page_id/treatment(.:format)
  


  
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

    get '/pages/:id/edit/edit_treatment', to: 'pages#edit_treatment', as: :edit_treatment
    match "pages/:id/update/update_treatment" => "pages#update_treatment", as: :update_treatment, via: [:patch, :post]
    
  
    
    #/pages/:id/treatment/:id/create/create_dr_note(.:format)
    #/treatments/:treatment_id/schedules/:id(.:format)

    #Nested edits and updates (schedule, prescriptions, doctor notes, nurse notes)
    #get '/pages/treatment/:treatment_id/edit/schedule/:id/edit_schedule', to: 'pages#edit_schedule', as: :edit_schedule
    #match "/pages/treatment/:treatment_id/update/schedule/:id/update_schedule" => "pages#update_schedule", as: :update_schedule, via: [:patch, :post]
    

    get '/pages/:patient_id/treatment/:treatment_id/edit_schedule/:schedule_id', to: 'pages#edit_schedule', as: :edit_schedule
    match "pages/:patient_id/treatment/:treatment_id/update_schedule/:schedule_id" => "pages#update_schedule", as: :update_schedule, via: [:patch, :post]

    
    get '/pages/:patient_id/treatment/:treatment_id/edit_prescription/:prescription_id', to: 'pages#edit_prescription', as: :edit_prescription
    match "pages/:patient_id/treatment/:treatment_id/update_prescription/:prescription_id" => "pages#update_prescription", as: :update_prescription, via: [:patch, :post]


    get '/pages/:patient_id/treatment/:treatment_id/edit_dr_note/:dr_id', to: 'pages#edit_dr_note', as: :edit_dr_note
    match "pages/:patient_id/treatment/:treatment_id/update_dr_note/:dr_id" => "pages#update_dr_note", as: :update_dr_note, via: [:patch, :post]








    get '/pages/:discharge/bill/:bill_id/edit_charge/:charge_id', to: 'pages#edit_charge', as: :edit_charge
    match "/pages/:discharge/bill/:bill_id/update_charge/:charge_id" => "pages#update_charge", as: :update_charge, via: [:patch, :post]
        
    #end of nested edits and updates

    #Adding new records
  
    get '/pages/:id/new_physician', to: 'pages#new_physician', as: :create_physician
    match "/pages/:id/new_physician" => "pages#create_physician", as: :new_physician, :via => [:patch, :post]

    get '/pages/:id/new_location', to: 'pages#new_location', as: :create_location
    match "/pages/:id/new_location" => "pages#create_location", as: :new_location, :via => [:patch, :post]

    get '/pages/:id/new_insurance', to: 'pages#new_insurance', as: :create_insurance
    match "/pages/:id/new_insurance" => "pages#create_insurance", as: :new_insurance, :via => [:patch, :post]

    get '/pages/:id/new_emergency_contact', to: 'pages#new_emergency_contact', as: :create_emergency_contact
    match "/pages/:id/new_emergency_contact" => "pages#create_emergency_contact", as: :new_emergency_contact, :via => [:patch, :post]

    get '/pages/:id/new_contact', to: 'pages#new_contact', as: :create_contact
    match "/pages/:id/new_contact" => "pages#create_contact", as: :new_contact, :via => [:patch, :post]

    get '/pages/:id/new_discharge', to: 'pages#new_discharge', as: :create_discharge
    match "/pages/:id/new_discharge" => "pages#create_discharge", as: :new_discharge, :via => [:patch, :post]

    get '/pages/:id/new_treatment', to: 'pages#new_treatment', as: :create_treatment
    match "/pages/:id/new_treatment" => "pages#create_treatment", as: :new_treatment, :via => [:patch, :post]

    
    get '/pages/:id/treatment/:id/new_schedule', to: 'pages#new_schedule', as: :create_schedule
    match "/pages/:id//treatment/:id/new_schedule" => "pages#create_schedule", as: :new_schedule, :via => [:patch, :post]
    
    get '/pages/:id/treatment/:id/new_dr_note', to: 'pages#new_dr_note', as: :create_dr_note
    match "/pages/:id//treatment/:id/new_dr_note" => "pages#create_dr_note", as: :new_dr_note, :via => [:patch, :post]
    
    get '/pages/:id/treatment/:id/new_prescription', to: 'pages#new_prescription', as: :create_prescription
    match "/pages/:id//treatment/:id/new_prescription" => "pages#create_prescription", as: :new_prescription, :via => [:patch, :post]
    
    get '/pages/:id/discharge/:id/new_bill', to: 'pages#new_bill', as: :create_bill
    match "/pages/:id//discharge/:id/new_bill" => "pages#create_bill", as: :new_bill, :via => [:patch, :post]
    
    get '/pages/:id/discharge/:id/new_charge', to: 'pages#new_charge', as: :create_charge
    match "/pages/:id//discharge/:id/new_charge" => "pages#create_charge", as: :new_charge, :via => [:patch, :post]
    

  #If a route isn't recognized then let error controller handle it, this needs to be on the last line
    get '*path' => 'error_routes#routing'
end
