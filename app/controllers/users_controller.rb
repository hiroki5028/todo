class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: :categories, action: :index
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :address, :password, :password_confirmation)
  end
end
