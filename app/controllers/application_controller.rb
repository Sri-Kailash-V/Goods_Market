class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_login

  def verify_login
    @mid= session[:mid]
    @cid =session[:cid]
   
    if @mid.nil?&&@cid.nil?
      redirect_to root_path
    end
    
  end
  # def not_found
  #   raise ActionController::RoutingError.new("not found")
  # end
  # # rescue_from ActionController::RoutingError do |exception|
  #   flash[:error] = "There is no such route"
  #   redirect_to root_url
  # end
  
end
