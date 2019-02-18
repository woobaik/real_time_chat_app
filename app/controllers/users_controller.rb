class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you for signing up!"
      session[:user_id] = @user.id
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
    if @user.update(user_params)
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

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

end
