class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
   
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
    add_flash_types :info, :error, :warning
    
    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :mobile_number, :role, :role_user_id, :email, :confirmation_token, :password, :password_confirmation )}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :mobile_number, :role, :role_user_id, :email, :password, :current_password)}
         end

         def user_not_authorized
          flash[:warning] = "You are not authorized to perform this action."
          redirect_to(request.referrer || root_path)
        end
         
end
