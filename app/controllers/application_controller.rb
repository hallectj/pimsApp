class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :checkAdminAndUrl?
  
  
rescue_from Exception do |exception|
  unless Rails.env.production?
    raise exception
  else
    redirect_to :back, :flash => { :error => exception.message } 
  end
end  
  
rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = exception.message
  respond_to do |wants|
    wants.html { redirect_to main_app.root_url }
    wants.js { render :file => "shared/update_flash_messages" }
  end
end

unless Rails.application.config.consider_all_requests_local
  rescue_from AbstractController::ActionNotFound, with: :handle_error
end

unless Rails.application.config.consider_all_requests_local
  rescue_from ActionController::UnknownFormat, with: :raise_not_found
end


  #def after_sign_in_path_for(resource)
    #redirect_to :authenticated_root
  #end
  #need logic here to render based off privelages or roles, check if user

#called by last route matching unmatched routes.  
#Raises RoutingError which will be rescued from in the same way as other exceptions.
def raise_not_found!
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
end   

private
  def checkAdminAndUrl?
    if user_signed_in?
      if !current_user.superadmin_role and request.fullpath.include?('admin')
        redirect_to '/'
      end
    end
  end

protected
  def handle_error
    redirect_to :back
  end

  def raise_not_found
    render(text: 'Not Found', status: 404)
  end

end
