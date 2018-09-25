class PagesController < ApplicationController
    #load_and_authorize_resource :class => PagesController
    #before_action :look_patients, only: [:show, :edit, :update, :destroy]
    before_action :isAdmin?
    
    def index
    end
    def show
        #redirect_to action: "patientSearchPage"
    end
    def new
    end
    def patientSearchPage
        #if user.volunteer_role?
          
        #end
    end
    def edit
    end
    def create
    end
    def update
    end
    def destroy
    end
    
    private
  
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
