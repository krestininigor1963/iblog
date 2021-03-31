class UsersController < ApplicationController
	

  def new
  	@user = User.new
  end


  def show
  	@user = User.find(params[:id])
  end

  
  def create
  	@user = User.new(params_user)
  	if @user.save
        # Handle a successful save.
        flash[:success] = "Welcome to the iBlog App!"
        redirect_to user_path(@user)
  	else
  	   render :new
  	end
  end


private 
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
