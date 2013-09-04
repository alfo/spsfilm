class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
  
  	user = User.find_by_email(params[:email])
  	if user
  		user.send_password_reset
  		redirect_to root_url, :notice => "Password reset email sent"
  	else
  		flash[:error] = "No user with that email could be found"
  		redirect_to new_password_reset_path
  	end
  end
  
  def edit
  
  	@user = User.find_by_password_reset_token!(params[:id])
  
  end
  
  def update
  	@user = User.find_by_password_reset_token!(params[:id])

  	if @user.update_attributes(password_params)
  		redirect_to login_path, :notice => 'Password reset successfully'
  	else
  		render :edit
  	end
  end
  
  private
  
  def password_params
  	params.require(:user).permit(:password)
  end
end
