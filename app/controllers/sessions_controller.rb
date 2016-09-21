class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_links_path(@user)
    else
      flash.now[:error] = "Invalid. Please try again or sign up if you do not have an account."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
