class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end


  def show
  	@user = User.find(params[:id])
  end

  
  def create
  	@user = User.new(params_user)
  	if @user.save
        log_in @user
        # Handle a successful save.
        flash[:success] = "Welcome to the iBlog App!"
        redirect_to user_path(@user)
  	else
        render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end
  

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
       # Handle a successful update. 
       flash[:success] = "Profile updated"
       redirect_to @user
    else
        render 'edit'
    end

  end


private 
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # def logged_in_user
  #   unless logged_in?
  #     store_location
  #     flash[:danger] = "Please log in."
  #     redirect_to login_url
  #   end
  # end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless currentuser?(@user)
  end

end
