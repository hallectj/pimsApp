class PagesController < ApplicationController
    @recordLocation = ""
    #load_and_authorize_resource :class => PagesController
    #before_action :look_patients, only: [:show, :edit, :update, :destroy]
  
<<<<<<< HEAD
=======
  
>>>>>>> 75b0497ddfc4d177edf96b2de22d328326c533c0
    layout 'pagesPatientResults', only: [:pagesPatientResults]
  
    before_action :isAdmin?
    before_action :determineRollCustomAction, only: [:index]  
<<<<<<< HEAD
=======
  
    #let's me know what view I'm in so I can update only
    #those fields
    before_action :getPointerParam
  
>>>>>>> 75b0497ddfc4d177edf96b2de22d328326c533c0
    before_action :look_patients, only: [:show, :destroy, :update_patient, "edit_patient"]
    before_action :look_physicians, only: [:show, :edit, :update, :destroy]
    before_action :look_emergency_contacts, only: [:show, :edit, :update, :destroy]
    before_action :look_contacts, only: [:show, :edit, :update, :destroy]
    before_action :look_locations, only: [:show, :edit, :update, :destroy]
<<<<<<< HEAD
    before_action :look_admittances, only: [:show, :edit_patient, :update_patient, :destroy]
=======
    before_action :look_admittances, only: [:show, :update_admittance, :edit_patient, :destroy]
>>>>>>> 75b0497ddfc4d177edf96b2de22d328326c533c0
    before_action :look_insurances, only: [:show, :edit, :update, :destroy]
    
    def index
    end
  
    def new
        @patient = Patient.new
<<<<<<< HEAD
        @patient.admittance.build
=======
        #@patient.admittance.build
>>>>>>> 75b0497ddfc4d177edf96b2de22d328326c533c0
        #treatment = @patient.treatments.build
        #discharge = @patient.discharges.build
        
        @physician = Physician.new
        @emergency_contact = Emergency_contact.new
        @contact = Contact.new
        @location = Location.new
        @admittance = Admittance.new
        @insurance = Insurance.new
    end
  
    def create
        @patient = Patient.new(patient_params) 
      
        if @patient.save
          render redirect_to root_path
        else
          render 'new_patient'
        end
      
        @physician = Physician.new(physician_params)
        @emergency_contact = Emergency_contact.new(emergency_contact_params)
        @contact = Contact.new(contact_params)
        @location = Location.new(location_params)
        @admittance = Admittance.new(admittance_params)
        @insurance = Insurance.new(insurance_params)
    end
    
    def show
        @patient = Patient.find(params[:id])
        @admittance = Admittance.find_by(patient_id: params[:patient_id]) 
    end
  
    def edit
      @patient = Patient.find(params[:id])
    end
  
    def destroy
    end
  
    #my custom restfuls
    ########   PATIENT CUSTOM ACTIONS  ###########################
    def new_patient
      @patient = Patient.new
      @admittance = Admittance.new
    end
  
    def edit_patient
      @patient = Patient.find(params[:id])
    end
    
    def update_patient
      @recordLocation = ""
      if @patient.update(patient_params)
        render 'show'
      else
        render 'edit_patient'
      end
    end
    ########   END PATIENT CUSTOM ACTIONS  ######################
    
    
  
  
  
    def edit_admittance
      @patient = Patient.find(params[:id]) 
      @admittance = @patient.build_admittance if @patient.admittance.nil?
    end
    
    def update_patient
      @patient = Patient.find(params[:id])
      @admittance = @patient.admittance
     
      if @patient.update(patient_params)
        render 'show'
      else
        render 'edit_patient'
      end
    end
  
    def update_admittance
      @patient = Patient.find(params[:id])
      @admittance = @patient.build_admittance
      if @admittance.update(admittance_params)
        render 'show'
      else
         flash.now[:error] = "Cannot updating your profile"
         render 'edit_admittance'
      end
    end
  
    ########   END PATIENT CUSTOM ACTIONS  ######################
  
    #create my 4 custom actions here for each role
    def doctorView
      @patients = Patient.all
    end
  
    def officeView
      @patients = Patient.all
    end
  
    def medicalView
      @patients = Patient.all
    end
  
    def volunteerView
      @patients = Patient.all
    end
    
    def pagesPatientResults
       @patients = Patient.where("last_name like ?", "%#{params[:search]}")
    end
  
    def patientSearchPage
    end
  
private
    def determineRollCustomAction
      path = ""
      if current_user.doctor_role
        path = doctor_path
      elsif current_user.office_role
        path = office_path
      elsif current_user.medical_role
        path = medical_path
      elsif current_user.volunteer_role
        path = volunteer_path
      end
      redirect_to path
    end
  
    def look_patients
      @patient = Patient.find(params[:id])
    end  
  
    def patient_params
      params.require(:patient).permit(:id, :first_name, :middle_name, :last_name, :search, admittance_attributes: [:date, :time, :reason], treatment_attributes: [:name, schedules_attributes: [:date, :time, :schedule_msg], prescriptions_attributes: [:name, :amount, :schedule], dr_notes_attributes: [:name, :message], n_notes_attributes: [:name, :message]], discharge_attributes: [:date, :time, bill_attributes: [:amount_paid, :amount_owed, :amount_insurance, charges_attributes: [:charge_name, :charge_amount]]])
    end
  
    #def patient_params
      #params.fetch(:patient, {}).permit!
    #end
    
    def look_physicians
        @physician = Physician.find_by(patient_id: params[:patient_id])
    end
    def physician_params
        params.require(:physician).permit(:family_physician, :physician_phone)
    end
    
    def look_emergency_contacts
        @emergency_contact = EmergencyContact.find_by(patient_id: params[:patient_id])
    end
    def emergency_contact_params
        params.require(:emergency_contact).permit(:e1_name, :e2_name, :e2_name, :e2_phone)
    end
    
    def look_contacts
        @contact = Contact.find_by(patient_id: params[:patient_id])
    end
    def contact_params
        params.require(:contact).permit(:home_phone, :work_phone, :mobile_phone, :street, :city, :state, :zip)
    end
    
    def look_locations
        @location = Location.find_by(patient_id: params[:patient_id])
    end
    def location_params
        params.require(:location).permit(:facility, :room, :bed, :visitor_limit, :approved_visitors)
    end
    
    def look_admittances
        @admittance = Admittance.find_by(patient_id: params[:patient_id])
    end
    def admittance_params
        params.require(:admittance).permit(:patient_id, :date, :time, :reason)
    end
    
    def look_insurances
        @insurance = Insurance.find_by(patient_id: params[:patient_id])
    end
    def insurance_params
        params.require(:insurance).permit(:policy_num, :policy_name, :group_num)
    end
    
    def getPointerParam
      @recordLocation = params[:pointer] ||= " "
    end
  
    def isAdmin?
      if current_user.superadmin_role
        redirect_to rails_admin.dashboard_path
      end
    end  
end
