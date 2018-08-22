class Choice < ApplicationRecord
  belongs_to :word
  # validate :check_choice

  validates :content, presence: true, length: { maximum: 20 }

  # def check_choice
  #   choices = correct.collect { |c| c.correct || nil }
  #   choice = choices.compact
  #   if choice.nil? 
  #     errors.add(:correct, "can't be blank")
  #   end
  # end

end
