class PagesController < ApplicationController
    #load_and_authorize_resource :class => PagesController
    #before_action :look_patients, only: [:show, :edit, :update, :destroy]
    before_action :isAdmin?
    before_action :determineRollCustomAction, only: [:index]  
    before_action :look_patients, only: [:show, :edit, :update, :destroy]
    before_action :look_physicians, only: [:show, :edit, :update, :destroy]
    before_action :look_emergency_contacts, only: [:show, :edit, :update, :destroy]
    before_action :look_contacts, only: [:show, :edit, :update, :destroy]
    before_action :look_locations, only: [:show, :edit, :update, :destroy]
    before_action :look_admittances, only: [:show, :edit, :update, :destroy]
    before_action :look_insurances, only: [:show, :edit, :update, :destroy]
    def index
    end
    def show
    end
    def new
        @patient = Patient.new
        treatment = @patient.treatments.build
        discharge = @patient.discharges.build
        
        @physician = Physician.new
        @emergency_contact = Emergency_contact.new
        @contact = Contact.new
        @location = Location.new
        @admittance = Admittance.new
        @insurance = Insurance.new
    end
    def edit
    end
    def create
        @patient = Patient.new(patient_params)   
        @physician = Physician.new(physician_params)
        @emergency_contact = Emergency_contact.new(emergency_contact_params)
        @contact = Contact.new(contact_params)
        @location = Location.new(location_params)
        @admittance = Admittance.new(admittance_params)
        @insurance = Insurance.new(insurance_params)
    end
    def update
    end
    def destroy
    end
  
    def patientSearchPage
    end
  
    #create my 4 custom actions here for each role
    def doctorView  
        @patients = Patient.all.order("created at DESC")
    end
  
    def officeView
    end
  
    def medicalView
    end
  
    def volunteerView
    end
  
private
    def determineRollCustomAction
      path = ""
      if current_user.doctor_role
        path = pages_doctor_path
      elsif current_user.office_role
        path = pages_office_path
      elsif current_user.medical_role
        path = pages_medical_path
      elsif current_user.volunteer_role
        path = pages_volunteer_path
      end
      redirect_to path
    end
    
    
    def look_patients
      @patient = Patient.find(params[:id])
    end    
    def patient_params
      params.require(:patient).permit(:first_name, :middle_name, :last_name, treatment_attributes: [:name, schedules_attributes: [:date, :time, :schedule_msg], prescriptions_attributes: [:name, :amount, :schedule], dr_notes_attributes: [:name, :message], n_notes_attributes: [:name, :message]], discharge_attributes: [:date, :time, bill_attributes: [:amount_paid, :amount_owed, :amount_insurance, charges_attributes: [:charge_name, :charge_amount]]])
    end
    
    def look_physicians
        @physician = Physician.find(params[:id])
    end
    def physician_params
        params.require(:physician).permit(:family_physician, :physician_phone)
    end
    
    def look_emergency_contacts
        @emergency_contact = Emergency_contact.find(params[:id])
    end
    def emergency_contact_params
        params.require(:emergency_contact).permit(:e1_name, :e2_name, :e2_name, :e2_phone)
    end
    
    def look_contacts
        @contact = Contact.find(params[:id])
    end
    def contact_params
        params.require(:contact).permit(:home_phone, :work_phone, :mobile_phone, :street, :city, :state, :zip)
    end
    
    def look_locations
        @location = Location.find(params[:id])
    end
    def location_params
        params.require(:location).permit(:facility, :room, :bed, :visitor_limit, :approved_visitors)
    end
    
    def look_admittances
        @admittance = Admittance.find(params[:id])
    end
    def admittance_params
        params.require(:admittance).permit(:date, :time, :reason)
    end
    
    def look_insurances
        @insurance = Insurance.find(params[:id])
    end
    def insurance_params
        params.require(:insurance).permit(:policy_num, :policy_name, :group_num)
    end
    
    def isAdmin?
      if current_user.superadmin_role
        redirect_to rails_admin.dashboard_path
      end
    end  
end
