class UsersController < ApplicationController

  before_action :find_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_param)
    if @user.save
      flash[:success] = "Thank you for signing up!"
      session[:user_id] = @user.user.id
      redirect_to root_path
    else
      @errors = @user.errors
      flash.now[:error] = "There was something wrong with creating your account!"
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(users_param)
      flash[:success] = "Your account information has updated!"
    else
      flash[:error] = "There was something wrong with updating your account!"
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private

  def users_param
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
