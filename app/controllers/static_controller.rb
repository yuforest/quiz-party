class StaticController < ApplicationController
  def index
    @popular_quizzes = Quiz.all.limit(5)
    @new_quizzes = Quiz.all.limit(5)
  end

  def about
  end

  def privacy_policy
  end

  def terms
  end

  def operator
  end
end
