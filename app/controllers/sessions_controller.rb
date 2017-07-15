class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.name == capitalize(params[:session][:name])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid Login. Please try again."
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
