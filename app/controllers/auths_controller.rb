class AuthsController < ApplicationController

# Show a login form
def new
	if current_user
		redirect_to root_path
	else
		# Make a login form from an object that has username and password
		@user = User.new
	end
end

#authenticate user
def create
  if !(User.where(username_lower: params[:user][:username].downcase).empty?)
     @user = User.find_by(username: params[:user][:username])
    	if @user.authenticated?(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to schools_path    
    	else 
    		flash[:error] = "Your password is incorrect. Please try again."
        render action: 'new'
    	end
	else
    @user = User.new(username: params[:user][:username])
    render new_auth_path
  end
end

# Log out
def destroy
	session[:user_id] = nil
	redirect_to root_path
end


end