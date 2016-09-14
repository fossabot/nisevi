class UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if check_omniauth_provider?
      if @user.update(user_params)
        sign_in @user, :bypass => true # in case their password changed
        redirect_to root_path
      else
        #TODO test this render
        render "edit"
      end
    else
      if @user.update_with_password(user_params)
        sign_in @user, :bypass => true
        redirect_to root_path
      else
        render "edit"
      end
    end
  end

  private
    def user_params
      accessible = [:password, :password_confirmation]
      accessible << [:current_password] unless check_omniauth_provider?
      params.require(:user).permit(accessible)
    end
end
