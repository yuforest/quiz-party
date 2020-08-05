class StaticController < ApplicationController
  def index
    @popular_quizzes = Quiz.includes([:responses, :answers])
                           .left_joins(:responses)
                           .group("responses.quiz_id")
                           .order("count(responses.id) desc")
                           .limit(5)
    @new_quizzes     = Quiz.includes([:responses, :answers])
                           .order(created_at: :desc)
                           .limit(5)
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
