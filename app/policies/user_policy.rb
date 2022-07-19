# class UserPolicy < ApplicationPolicy
#     def index?
#         true
#     end

#     def show?
        
#         return true if user.present? && @current_user == @user
#     end
  
#     def update?
#         return true if user.present? && @current_user == @user
#     end
  
#     def destroy?
#         return true if user.present? && @current_user == @user
#     end
# end
  
class UserPolicy < ApplicationPolicy
    attr_reader :current_user, :user
  
    def initialize(current_user, user)
      @current_user = current_user
      @user = user
    end
  
    def index?
      true
    end
  
    def show?
        return true if user.present? && @current_user == @user
    end
  
    def update?
        return true if user.present? && @current_user == @user
    end
  
    def destroy?
        return true if user.present? && @current_user == @user
    end
  
  end