class ApplicationController < ActionController::Base
    # include Pundit
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
   

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :mobile_number, :role_id, :email, :password)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :mobile_number, :role_id, :email, :password, :current_password)}
         end
         
 
         
end
