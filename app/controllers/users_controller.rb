class UsersController < ApplicationController

	def index
    # uncomment and use instead of deleting cookies 
    # session[:user_id] = nil
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
        @user = User.new(user_params)
        if @user.save
            @user = User.find_by(username:params[:user][:username])
            if @user.authenticated?(params[:user][:password])
              session[:user_id] = @user.id
            end
            redirect_to root_path
        else
            flash[:error] = "All fields are required."
            render action: 'new'
        end
    end

	def edit
		@user = User.find(params[:id])
	end

	def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: 'Item was successfully updated.'
    else
      render action: 'edit', notice: 'Item was not updated'
    end
  end

  private
  def user_params
  	params.require(:user).permit(:username, :password)
  end

end