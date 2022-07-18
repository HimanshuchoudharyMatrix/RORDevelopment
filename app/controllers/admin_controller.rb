class AdminController < ApplicationController
    layout 'admin'
    before_action :authorize_admin
    
    private
    def authorize_admin
        authenticate_user!
        unless current_user.superadmin? || current_user.admin?
            redirect_to root_path, alert: "You must be an superadmin or admin to do that."
        end
    end
end