module StaticPagesHelper

  def lesson_category(lesson)
    lesson = Lesson.find(lesson)
    lesson.category
  end

  def find_lesson(lesson)
    Lesson.find(lesson)
  end
end
