class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  #def after_sign_in_path_for(resource)
    #redirect_to :authenticated_root
  #end
  #need logic here to render based off privelages or roles, check if user
  
end
