class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(address: params[:session][:address])

    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to controller: :categories, action: :index
    else
      flash.now.alert = "もう一度入力してください。"
      render :new
    end
  end

  def destroy
    logout
    render :new
  end
end
