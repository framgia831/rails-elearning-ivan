class StaticPagesController < ApplicationController
  before_action :logged_in_user

  
  def home
    @user = User.new
  end

  def dashboard
    @feed = current_user.dashboard_feed.order(created_at: :desc)
                        .page(params[:page]).per(6).order(created_at: :desc)
  end
  
end
