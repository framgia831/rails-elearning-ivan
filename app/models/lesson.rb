class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers
  has_many :words, through: :answers
  has_many :choices, through: :answers

  validates :user_id, presence: true
  validates :category_id, presence: true

  def next_word
    (category.words - words).first
  end

  def lesson_results
    choices.where(correct: true).count
  end

end