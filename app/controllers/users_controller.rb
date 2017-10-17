class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: :sessions, action: :new
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :address, :password, :password_confirmation)
  end
end
