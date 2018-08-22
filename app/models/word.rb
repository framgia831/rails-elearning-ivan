class Word < ApplicationRecord
  belongs_to :category
  
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  validates :content,presence: true, length: { maximum: 20 }
  validates :category_id, presence: true


  def correct_choice
    choices.find_by(correct: true)
  end
end
