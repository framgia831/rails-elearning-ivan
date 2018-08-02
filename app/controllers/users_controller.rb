class UsersController < ApplicationController
  

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
        login @user
        redirect_to root_path
      else
        render 'new'
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:notice] = 'Profile has been updated successfully'
        redirect_to @user
      else
        flash[:notice] = 'Profile update failed'
        render 'edit'
      end
  end

  def index
    if params[:search_user]
      @users = User.where('name LIKE ?', "%#{params[:search_user]}%").page(params[:page]).per(6)
    else
      @users = User.all.page(params[:page]).per(6)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :avatar)
  end

end
