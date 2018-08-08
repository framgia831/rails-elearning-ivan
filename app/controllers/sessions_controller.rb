class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        login user
        redirect_to root_url
      else
        flash[:notice] = 'Invalid User Credentials'
        render 'new'
      end
  end
  
  def destroy
    logout @user
    redirect_to root_path
  end
  
end
