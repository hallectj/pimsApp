class PassController < ApplicationController
  def index
    path = ""
    if user_signed_in?
      if current_user.superadmin_role
        path = rails_admin.dashboard_path
      elsif current_user.doctor_role || current_user.office_role || current_user.medical_role || current_user.volunteer_role
        #path = pages_patient_search_path
        path = search_path
      end
    end
    redirect_to path
  end
  
end
