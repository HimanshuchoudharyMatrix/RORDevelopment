class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy, :edit]
  def index
    @users = User.all.order("name ASC")
  end

  def show
    
  end

  def destroy
    #@user = User.find(params[:id])
    @user.destroy
     
    redirect_to users_path
  end

  def edit 
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  
end
