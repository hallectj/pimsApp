class PagesController < ApplicationController
  #load_and_authorize_resource :class => PagesController
  #before_action :look_patients, only: [:show, :edit, :update, :destroy]


  layout 'pagesPatientResults', only: [:pagesPatientResults]

  before_action :isAdmin?
  before_action :determineRollCustomAction, only: [:index]  

  #let's me know what view I'm in so I can update only
  #those fields
  before_action :getPointerParam

  before_action :look_patients, only: [:show, :destroy, :update_patient, "edit_patient"]
  before_action :look_physicians, only: [:show, :edit, :update, :destroy]
  before_action :look_emergency_contacts, only: [:show, :edit, :update, :destroy]
  before_action :look_contacts, only: [:show, :edit, :update, :destroy]
  before_action :look_locations, only: [:show, :edit, :update, :destroy]
  before_action :look_admittances, only: [:show, :update_admittance, :edit_patient, :destroy]
  before_action :look_insurances, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def new
      @patient = Patient.new
      #@patient.admittance.build
      #treatment = @patient.treatments.build
      #discharge = @patient.discharges.build
      
      @physician = Physician.new
      @emergency_contact = EmergencyContact.new
      @contact = Contact.new
      @location = Location.new
      @admittance = Admittance.new
      @insurance = Insurance.new
  end


  def create
      @patient = Patient.new(patient_params) 
    
      if @patient.save
        render 'show'
      else
        render 'new'
      end
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

  def edit_admittance
    @patient = Patient.find(params[:id]) 
    @admittance = @patient.update_admittance if @patient.admittance.nil?
  end

  def edit_discharge
    @patient = Patient.find(params[:id]) 
    @discharge = @patient.update_discharge if @patient.discharge.nil?
  end
    
    def edit_contact
        @patient = Patient.find(params[:id])
        @contact = @patient.update_contact if @patient.contact.nil?
    end
    
    def edit_physician
        @patient = Patient.find(params[:id])
        @physician = @patient.update_physician if @patient.physician.nil?
    end
    
    def edit_location
        @patient = Patient.find(params[:id])
        @location = @patient.update_location if @patient.location.nil?
    end
    
    def edit_emergency_contact
        @patient = Patient.find(params[:id])
        @emergency_contact = @patient.update_emergency_contact if @patient.emergency_contact.nil?
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
    @admittance = @patient.admittance
    if @admittance.update(admittance_params)
      render 'show'
    else
       flash.now[:error] = "Cannot updating your profile"
       render 'edit_admittance'
    end
  end

    def update_discharge
        @patient = Patient.find(params[:id])
        @discharge = @patient.discharge
        if @discharge.update(discharge_params)
          render 'show'
        else
          flash.now[:error] = "Cannot updating your profile"
          render 'edit_discharge'
        end
     end
    
    def update_contact
        @patient = Patient.find(params[:id])
        @contact = @patient.contact
        if @contact.update(contact_params)
            render 'show'
        else
            flash.now[:error] = "Cannot update Contact Information"
            render 'edit_contact'
        end
    end
    
    def update_physician
        @patient = Patient.find(params[:id])
        @physician = @patient.physician
        if @physician.update(physician_params)
            render 'show'
        else
            flash.now[:error] = "Cannot update Physician Information"
            render 'edit_physician'
        end
    end
    
    def update_location
        @patient = Patient.find(params[:id])
        @location = @patient.location
        if @location.update(location_params)
            render 'show'
        else
            flash.now[:error] = "Cannot update Location Information"
            render 'edit_location'
        end
    end
    
    def update_emergency_contact
        @patient = Patient.find(params[:id])
        @emergency_contact = @patient.emergency_contact
        if @emergency_contact.update(emergency_contact_params)
            render 'show'
        else
            flash.now[:error] = "Cannot update Emergency Contacts"
            render 'edit_emergency_contact'
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
    #replace wild cards and whitespace with regex wildcards
    searchString = params[:search].gsub("*", "%")
    #adapted from https://stackoverflow.com/questions/21470782/concat-inside-rails-query-conditions
    @patients = Patient.where("last_name like ? OR first_name like ? OR (first_name || ' ' || last_name) like ? OR (last_name || ' ' || first_name) like ?", "#{searchString}", "#{searchString}", "#{searchString}", "#{searchString}")
    #@patients = Patient.where("(first_name || ' ' || last_name) like ? OR (last_name || ' ' || first_name) like ?", "%#{searchString}%", "%#{searchString}%")
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
      params.require(:emergency_contact).permit(:e1_name, :e1_phone, :e2_name, :e2_phone)
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

  def discharge_params
      params.require(:discharge).permit(:patient_id, :date, :time)
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
