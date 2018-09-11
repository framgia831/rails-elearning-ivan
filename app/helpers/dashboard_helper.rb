module DashboardHelper

  def relationship(followed_id)
    User.find(followed_id)
  end
end