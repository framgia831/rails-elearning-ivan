class LessonsController < ApplicationController

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to new_lesson_answer_url(@lesson)  
    end
  end

  private

  def lesson_params
    params.permit(:category_id, :user_id)
  end
end
