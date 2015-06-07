class AdminsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    binding.pry
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
    params.require(:user).permit(:username, :password, :password_confirmation, :type)
  end
end
