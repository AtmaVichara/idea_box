class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Login Successful. Welcome #{user.username}"
      redirect_to user_path(user)
    else
      flash[:alert] = "Login Failed.\nPlease make sure your email and password are correct."
      render :new
    end
  end

  def destroy
    session.destroy

    redirect_to root_path
  end

end
