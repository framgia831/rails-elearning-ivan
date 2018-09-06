class User < ApplicationRecord
  before_save :downcase_email

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    length: { maximum: 50 }, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  #Relationships
  has_many :active_relationships,  class_name: 'Relationship', 
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                  foreign_key: 'followed_id',
                                  dependent: :destroy
                                  
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :lessons, dependent: :destroy
  has_many :activities, dependent: :destroy
  
  def downcase_email
    self.email = email.downcase
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? 
                        BCrypt::Engine::MIN_COST :
                        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def follow(user)
    following << user
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end
  
  def dashboard_feed
    following_ids = "SELECT followed_id FROM relationships
                 WHERE  follower_id = :user_id"
    Activity.where("user_id IN (#{ following_ids }) OR user_id = :user_id",
    following_ids: following_ids, user_id: id)
  end

end
