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
  def downcase_email
    self.email = email.downcase
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? 
                        BCrypt::Engine::MIN_COST :
                        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
