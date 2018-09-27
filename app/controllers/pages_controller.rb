class PagesController < ApplicationController
    #load_and_authorize_resource :class => PagesController
    #before_action :look_patients, only: [:show, :edit, :update, :destroy]
    before_action :isAdmin?
    before_action :determineRollCustomAction, only: [:index]  
  
    def index
      
    end
    def show
    end
    def new
    end
    def edit
    end
    def create
    end
    def update
    end
    def destroy
    end
  
    def patientSearchPage
    end
  
    #create my 4 custom actions here for each role
    def doctorView  
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
      params.require(:patient).permit(:first_name, :middle_name, :last_name)
    end
  
    def isAdmin?
      if current_user.superadmin_role
        redirect_to rails_admin.dashboard_path
      end
    end  
end
