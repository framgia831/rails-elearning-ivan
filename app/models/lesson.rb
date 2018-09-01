class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :words, through: :answers
  has_many :choices, through: :answers
  has_many :activities, as: :activity

  validates :user_id, presence: true
  validates :category_id, presence: true

  def next_word
    (category.words - words).first
  end

  def lesson_results
    choices.where(correct: true).count
  end

  def lesson_activity(current_user)
    activities.create(activity_id: id, activity_type: "Lesson", user_id: current_user.id)
  end

end
