class Admin::UsersController < AdminController
   
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :destroy, :edit, :update, :user_post]
    #before_action :set_post, only: [:user_post]
    def index
      if params[:search]
        @users = User.search(params[:search]).order("created_at DESC").page(params[:page]).per(4)
      else
        @users = User.all.order('created_at DESC').page(params[:page]).per(4)
      end
    end
  
    def destroy
      @user.destroy
       
      redirect_to admin_users_path
    end
  
    def edit 
    end

    def update 
      if @user.update(user_params)
          redirect_to admin_users_path
      else 
        render 'edit'
      end
    end


    def welcome
    end

    def user_post
    end
  
    def show
    end
  
    
    private
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.required(:user).permit(:name, :mobile_number, :role)
    end
  
  end
  