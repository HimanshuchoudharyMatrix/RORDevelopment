# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  
  # if User.find_by_email(params[:user][:email]).present?
  #   if User.find_by_email(params[:user][:email]).try(:confirmed_at).present?
  #    super
  #   else
  #    redirect_to :back, notice:  'Please confirm your email first'
  #   end
  #  else
  #   redirect_to :back, notice:  'User not found'
  #  end
  # end
  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

   protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    new_user_session_path
  end
end
