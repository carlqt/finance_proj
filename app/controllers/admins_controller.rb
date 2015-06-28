class AdminsController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new safe_params
    @user.password_confirmation = @user.password

    if @user.save
      redirect_to root_path, success: "New user created"
    else
      flash.now[:alert] = "User creation failed"
      render :new
    end
  end

  private
  def safe_params
    params.require(:user).permit(:username, :password, :password_confirmation, :type)
  end
end
