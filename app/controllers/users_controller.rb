class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if User::ADMINS.include?(params[:user][:email])
      @user = sign_up(user_params)

      if @user.valid?
        sign_in(@user)
        redirect_to root_path
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

