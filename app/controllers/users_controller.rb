class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :destroy, :edit, :update, :user_post]
  def index
    @users = User.all.order("name ASC")
  end

  def welcome

  end
  def user_post
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

  def update 
    @user.update(user_params)

    redirect_to users_path
    
  end

  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:name, :mobile_number, :role)
  end

  
end
