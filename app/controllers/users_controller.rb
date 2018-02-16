class UsersController < ApplicationController
  before_action :user_logged_in?, except: [:new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    user = User.find(params[:id])
    unless current_user.id == user.id
      redirect_to root_path
      flash[:notice] = "Sorry, you don't have access to this account!!"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:success] = "You have successfully signed up #{@user.username}"
    else
      render :new
      flash[:alert] = "Sorry. Something went wrong. Please try again and fill out the entire form."
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end

end
