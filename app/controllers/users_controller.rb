class UsersController < ApplicationController
	
	before_filter :only_if_logged_out, :except => [:logout, :edit, :update]

  def new
  	@user = User.new
  end
  
  def create
  	user = User.new(user_params)
  	
  	# Check validations
  	user.valid?
  	
  	if user.errors.any?
  		flash[:error] = user.errors.full_messages.join(', ')
  		redirect_to signup_path and return
  	else
	  	begin
	  		if user.save
		  		cookies.signed[:current_user] = {
					:value => user.id,
					:httponly => true,
					:expires => 6.months.from_now
				}
		  		redirect_to root_path
		  	else
		  		flash[:error] = user.errors.full_messages.join(', ')
		  		redirect_to signup_path and return
		  	end
	  	rescue => e
	  		errors = e.message
	  		flash[:error] = errors
	  		redirect_to signup_path and return
	  	end
	end
  	
  end
  
  def edit
  end
  
  def update
  	user = user_params
  	if User.authenticate(current_user.email, user[:current_password])
  		current_user.update_attributes(user)
  		redirect_to root_url, :notice => "Account updated"
  	else
  		flash[:error] = "Your current password was entered incorrectly"
  		redirect_to account_path
  	end
  end

  def login
  end
  
  def login_do
  	user = User.authenticate(params[:email], params[:password])
  	if user
		cookies.signed[:current_user] = {
				:value => user.id,
				:httponly => true,
				:expires => 6.months.from_now
			}
		redirect_to root_path
	else
		flash[:alert] = "Login email / password incorrect"
		redirect_to login_path
	end
  end
  
  def logout
  	cookies.delete :current_user
	redirect_to root_url
  end
  
  private
  def user_params
  	params.require(:user).permit(:email, :password, :account_type, :current_password)
  end
end
