class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    relationship = current_user.active_relationships.find_by(followed_id: @user.id)
    relationship.create_activity(user: current_user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    relationship = Relationship.find_by(follower_id: current_user, followed_id: @user.id)
    relationship.activity.destroy
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
