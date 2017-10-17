class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(address: params[:session][:address])

    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to controller: :pages, action: :top
    else
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
