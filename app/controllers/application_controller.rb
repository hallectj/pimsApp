class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  #need logic here to render based off privelages or roles, check if user
  
end
