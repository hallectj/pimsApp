class ErrorRoutesController < ApplicationController
  def routing
    #render :text => 'Not Found', :status => '404'
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end
