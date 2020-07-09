class StaticController < ApplicationController
  def index
    @popular_quizzes = Quiz.all.limit(5)
    @new_quizzes = Quiz.all.limit(5)
  end

  def about
  end

  def privary_policy
  end

  def terms
  end
end
