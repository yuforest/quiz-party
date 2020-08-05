class StaticController < ApplicationController
  def index
    @popular_quizzes = Quiz.includes([:responses, :answers])
                           .add_responses_count
                           .order("count(responses.id) desc")
                           .limit(5)
    @new_quizzes     = Quiz.includes([:responses, :answers])
                           .add_responses_count
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
