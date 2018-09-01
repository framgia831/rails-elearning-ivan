class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
  has_many :activities, as: :activity
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  def relationship_activity(current_user)
    activities.create(activity_id: id, activity_type: "Relationship", user_id: current_user.id)
  end
end
