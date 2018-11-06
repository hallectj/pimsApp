class PagesController < ApplicationController
  #load_and_authorize_resource :class => PagesController
  #before_action :look_patients, only: [:show, :edit, :update, :destroy]


  layout 'pagesPatientResults', only: [:pagesPatientResults]

  before_action :isAdmin?
  before_action :determineRollCustomAction, only: [:index]  

  #let's me know what view I'm in so I can update only
  #those fields
  before_action :getPointerParam

  before_action :look_patients, only: [:show, :destroy, :update_patient, :edit_patient]
  before_action :look_physicians, only: [:show, :edit, :update, :destroy]
  before_action :look_emergency_contacts, only: [:show, :edit, :update, :destroy]
  before_action :look_contacts, only: [:show, :edit, :update, :destroy]
  before_action :look_locations, only: [:show, :edit, :update, :destroy]
  before_action :look_admittances, only: [:show, :update_admittance, :edit_patient, :destroy]
  before_action :look_insurances, only: [:show, :edit, :update, :destroy]
  before_action :look_treatments, only: [:show, :edit_treatment, :update_treatment, :destroy]
  before_action :look_schedules, only: [:show, :edit_schedule, :update_schedule, :destroy]
  before_action :look_prescriptions, only: [:show, :edit_prescription, :update_prescription, :destroy]
  before_action :look_dr_notes, only: [:show, :edit_dr_note, :update_dr_note, :destroy]
  
  def index
  end

  def new
      @patient = Patient.new
  end

  def create
      @patient = Patient.new(patient_params) 
    
      if @patient.save
        render 'show'
      else
        render 'new_patient'
      end
    
      @admittance = Admittance.new(admittance_params)
  end

  def show
    @patient = Patient.find(params[:id])
    @admittance = Admittance.find_by(patient_id: params[:patient_id]) 
    
    #@treatment = @patient.build_treatment
    #@schedules = @treatment.schedules.build
    #@prescriptions = @treatment.prescriptions.build
    #@n_notes = @treatment.n_notes.build
    #@dr_notes = @treatment.dr_notes.build
    #@bills = @discharge.build_bill
    
    respond_to do |format|
      format.html
      format.pdf do
        if current_user.doctor_role
          pdf = PatientShowDoctorPdf.new(@patient)
          send_data pdf.render, filename: "patient name: #{@patient.last_name}.pdf", type: "application/pdf", dispostion: "inline"
        elsif current_user.office_role
          #not created yet
          #pdf = PatientShowOfficePdf.new(@patient)
          #send_data pdf.render, filename: "patient name: #{@patient.last_name}.pdf", type: "application/pdf", dispostion: "inline"
        elsif current_user.medical_role
          #not created yet
          #pdf = PatientShowMedicalPdf.new(@patient)
          #send_data pdf.render, filename: "patient name: #{@patient.last_name}.pdf", type: "application/pdf", dispostion: "inline"
        elsif current_user.volunteer_role
          #not created yet
          #pdf = PatientShowVolunteerPdf.new(@patient)
          #send_data pdf.render, filename: "patient name: #{@patient.last_name}.pdf", type: "application/pdf", dispostion: "inline"
        end
      end
    end
  end

  def edit
      @patient = Patient.find(params[:id])
  end

  def destroy
  end

  #delete everything associated with patient including patient him or herself.
  def reset
    Rails.application.eager_load!
    ActiveRecord::Base.descendants.each { |c| c.delete_all unless c == ActiveRecord::SchemaMigration  }
  end

  #my custom restfuls
  ########   PATIENT CUSTOM ACTIONS  ###########################
  def new_patient
    @patient = Patient.new
    @admittance = Admittance.new
  end
    
  def new_schedule
      @patient = Patient.new
      @patient.build_treatment.schedules.build
  end

  def new_prescription
    @patient = Patient.new
    @patient.build_treatment.prescriptions.build
  end

  def new_dr_note
    @patient = Patient.new
    @patient.build_treatment.dr_notes.build
  end
    
    def new_n_note
        @patient = Patient.new
        @patient.build_treatment.n_notes.build
    end

  def new_contact
      @patient = Patient.find(params[:id])
  end

  def new_discharge
      @patient = Patient.find(params[:id])
  end

  def new_physician
      @patient = Patient.find(params[:id])
  end

  def new_location
      @patient = Patient.find(params[:id])
  end

  def new_insurance
      @patient = Patient.find(params[:id])
  end

  def new_emergency_contact
      @patient = Patient.find(params[:id])
  end

  def new_treatment
    @patient = Patient.find(params[:id])
  end

  

  def create_emergency_contact
      @patient = Patient.find(params[:id])
      @emergency_contact = @patient.build_emergency_contact(emergency_contact_params)
      if @emergency_contact.save
          render 'show'
      else
          render 'new_emergency_contact'
      end
  end  


  def create_insurance
      @patient = Patient.find(params[:id])
      @insurance = @patient.build_insurance(insurance_params)
      if @insurance.save
          render 'show'
      else
          render 'new_insurance'
      end
  end  

  def create_location
      @patient = Patient.find(params[:id])
      @location = @patient.build_location(location_params)
      if @location.save
          render 'show'
      else
          render 'new_location'
      end
  end  

  def create_physician
      @patient = Patient.find(params[:id])
      @physician = @patient.build_physician(physician_params)
      if @physician.save
          render 'show'
      else
          render 'new_physician'
      end
  end  

  def create_discharge
      @patient = Patient.find(params[:id])
      @discharge = @patient.build_discharge(discharge_params)
      if @discharge.save
          render 'show'
      else
          render 'new_discharge'
      end
  end  
      
  def create_schedule
    @patient = Patient.find(params[:id])
    @treatment = @patient.treatment
    @schedule = @treatment.schedules.build(schedule_params)
    if @schedule.save
        render 'show'
    else
        render 'new_schedule'
    end
  end

  def create_prescription
    @patient = Patient.find(params[:id])
    @treatment = @patient.treatment
    @prescription = @treatment.prescriptions.build(prescription_params)
    if @prescription.save
        render 'show'
    else
        render 'new_prescription'
    end
  end

  def create_dr_note
    @patient = Patient.find(params[:id])
    @treatment = @patient.treatment
    @dr_note = @treatment.dr_notes.build(dr_note_params)
    if @dr_note.save
        render 'show'
    else
        render 'new_dr_note'
    end
  end
    
    def create_n_note
    @patient = Patient.find(params[:id])
    @treatment = @patient.treatment
    @n_note = @treatment.n_notes.build(n_note_params)
    if @n_note.save
        render 'show'
    else
        render 'new_n_note'
    end
  end

  def create_contact
      @patient = Patient.find(params[:id])
      @contact = @patient.build_contact(contact_params)
      if @contact.save
          render 'show'
      else
          render 'new_contact'
      end
  end        

  def create_treatment
    @patient = Patient.find(params[:id])
    @treatment = @patient.build_treatment(treatment_params)
    if @treatment.save
        render 'show'
    else
        render 'new_treatment'
    end
  end 

  def new_dr_note
      @patient = Patient.new
      @patient.build_treatment.dr_notes.build
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

  def edit_treatment
    @patient = Patient.find(params[:id])
    @treatment = @patient.update_treatment if @patient.treatment.nil?
  end
    
  def edit_contact
      @patient = Patient.find(params[:id])
      if (@patient.contact.nil?)
          @contact = Contact.new(patient_id: @patient.id)
      else
          @contact = @patient.update_contact if @patient.contact.nil?
      end
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

  #nested edits and updates
  def edit_schedule
    @patient = Patient.find(params[:patient_id])
    @treatment = @patient.treatment
    @schedule = @patient.treatment.schedules.find(params[:schedule_id])
    @schedule.update if @schedule.nil?
  end

  def edit_prescription
    @patient = Patient.find(params[:patient_id])
    @treatment = @patient.treatment
    @prescription = @patient.treatment.prescriptions.find(params[:prescription_id])
    @prescription.update if @prescription.nil?
  end

  def edit_dr_note
    @patient = Patient.find(params[:patient_id])
    @treatment = @patient.treatment
    @dr_note = @patient.treatment.dr_notes.find(params[:dr_id])
    @dr_note.update if @dr_note.nil?
  end
    
    def edit_n_note
    @patient = Patient.find(params[:patient_id])
    @treatment = @patient.treatment
    @n_note = @patient.treatment.n_notes.find(params[:n_id])
    @n_note.update if @n_note.nil?
  end

  def update_schedule
    @patient = Patient.find(params[:patient_id])
    @schedule = @patient.treatment.schedules.find(params[:schedule_id])
    if @schedule.update(schedule_params)
        redirect_to page_path(@patient)
    else
        flash.now[:error] = "Cannot update Schedule"
        render 'edit_schedule'
    end
  end

  def update_dr_note
    @patient = Patient.find(params[:patient_id])
    @dr_note = @patient.treatment.dr_notes.find(params[:dr_id])
    if @dr_note.update(dr_note_params)
        redirect_to page_path(@patient)
    else
        flash.now[:error] = "Cannot update Dr note"
        render 'edit_dr_note'
    end
  end
    
    def update_n_note
    @patient = Patient.find(params[:patient_id])
    @n_note = @patient.treatment.n_notes.find(params[:n_id])
    if @n_note.update(n_note_params)
        redirect_to page_path(@patient)
    else
        flash.now[:error] = "Cannot update Nurse note"
        render 'edit_n_note'
    end
  end

  def update_prescription
    @patient = Patient.find(params[:patient_id])
    @prescription = @patient.treatment.prescriptions.find(params[:prescription_id])
    if @prescription.update(prescription_params)
        redirect_to page_path(@patient)
    else
        flash.now[:error] = "Cannot update Prescription"
        render 'edit_prescription'
    end
  end

  

  #end of nested edits and updates
  
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
       flash.now[:error] = "Cannot update your Admittance"
       render 'edit_admittance'
    end
  end

    def update_discharge
        @patient = Patient.find(params[:id])
        @discharge = @patient.discharge
        if @discharge.update(discharge_params)
          render 'show'
        else
          flash.now[:error] = "Cannot update your Discharge"
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

    def update_treatment
        @patient = Patient.find(params[:id])
        @treatment = @patient.treatment
        if @treatment.update(treatment_params)
            render 'show'
        else
            flash.now[:error] = "Cannot update Treatment Information"
            render 'edit_treatment'
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

  def look_schedules
    @schedule = Schedule.find_by(treatment_id: params[:treatment_id])
  end

  def look_prescriptions
    @prescription = Prescription.find_by(treatment_id: params[:treatment_id])
  end

  def look_dr_notes
    @dr_note = DrNote.find_by(treatment_id: params[:treatment_id])
  end

  def look_treatments
    @treatment = Treatment.find_by(patient_id: params[:patient_id])
  end

  def patient_params
    params.require(:patient).permit(:id, :first_name, :middle_name, :last_name, :birthday, :search, admittance_attributes: [:date, :time, :reason], treatment_attributes: [:name, schedules_attributes: [:date, :time, :schedule_msg], prescriptions_attributes: [:name, :amount, :schedule], dr_notes_attributes: [:name, :message], n_notes_attributes: [:name, :message]], discharge_attributes: [:date, :time, bill_attributes: [:amount_paid, :amount_owed, :amount_insurance, charges_attributes: [:charge_name, :charge_amount]]])
  end

  def prescription_params
    params.fetch(:prescription, {}).permit!
  end
  
  def look_physicians
      @physician = Physician.find_by(patient_id: params[:patient_id])
  end
  def physician_params
      if(params.has_key?(:physician))
          params.require(:physician).permit(:family_physician, :physician_phone)
      else 
          params.fetch(:physician, {}).permit!
      end
  end
  
  def look_emergency_contacts
      @emergency_contact = EmergencyContact.find_by(patient_id: params[:patient_id])
  end
  
  def emergency_contact_params
      if(params.has_key?(:emergency_contact))
          params.require(:emergency_contact).permit(:e1_name, :e1_phone, :e2_name, :e2_phone)
      else
          params.fetch(:physician, {}).permit!
      end
  end
  
  def look_contacts
      @contact = Contact.find_by(patient_id: params[:patient_id])
  end
  def contact_params
      if(params.has_key?(:contact))
          params.require(:contact).permit(:home_phone, :work_phone, :mobile_phone, :street, :city, :state, :zip)
      else
          params.fetch(:contact, {}).permit!
      end
  end

  #def new_contact_params
      #params.permit(:patient_id, :home_phone, :work_phone, :mobile_phone, :street, :city, :state, :zip)
  #end

  def look_locations
      @location = Location.find_by(patient_id: params[:patient_id])
  end
  def location_params
      if(params.has_key?(:location))
          params.require(:location).permit(:facility, :room, :bed, :visitor_limit, :approved_visitors)
      else
          params.fetch(:location, {}).permit!
      end
  end
  
  def look_admittances
      @admittance = Admittance.find_by(patient_id: params[:patient_id])
  end
  def admittance_params
      if(params.has_key?(:admittance))
          params.require(:admittance).permit(:patient_id, :date, :time, :reason)
      else
          params.fetch(:admittance, {}).permit!
      end
  end

  def discharge_params
      if(params.has_key?(:discharge))
          params.require(:discharge).permit(:patient_id, :date, :time)
      else
          params.fetch(:discharge, {}).permit!
      end
  end
  
  def look_insurances
      @insurance = Insurance.find_by(patient_id: params[:patient_id])
  end
  def insurance_params
      if(params.has_key?(:insurance))
          params.require(:insurance).permit(:policy_num, :policy_name, :group_num)
      else
          params.fetch(:insurance, {}).permit!
      end    
  end
  
  def treatment_params
      if(params.has_key?(:treatment))
          params.require(:treatment).permit(:name, schedules_attributes: [:date, :time, :schedule_msg], prescriptions_attributes: [:name, :amount, :schedule], dr_notes_attributes: [:name, :message], n_notes_attributes: [:name, :message] )
      else
          params.fetch(:treatment, {}).permit!
      end  
  end

  def schedule_params
      #if(params.has_key?(:schedule))
          #params.require(:patient).permit(:id, treatment_attributes: [:id, schedules_attributes: [:date, :time, :schedule_msg]])
          #params.require(:patient).permit!  
          #params.require(:schedule).permit(:patient_id, :date, :time, :schedule_msg)
      #else
          params.fetch(:schedule, {}).permit!
      #end 
  end

  def dr_note_params
      #if(params.has_key?(:dr_note))
         #params.require(:dr_note).permit(:name, :message)
      #else
          params.fetch(:dr_note, {}).permit!
      #end         
  end
  
  def n_note_params
      #if(params.has_key?(:n_note))
          #params.require(:n_note).permit(:name, :message)
      #else
          params.fetch(:n_note, {}).permit!
      #end         
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