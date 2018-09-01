class StaticPagesController < ApplicationController

  def home

  end

  def dashboard
    @feed = current_user.dashboard_feed.order(created_at: :desc)
                        .page(params[:page]).per(6).order(created_at: :desc)
  end
  
end
