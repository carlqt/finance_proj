class AdminsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new safe_params
    @user.password_confirmation = @user.password

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def safe_params
    params.require(:user).permit(:email, :password, :password_confirmation, :type)
  end
end