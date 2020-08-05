class Admin::QuizzesController < Admin::ApplicationController
  def index
    @quizzes  = Quiz.add_responses_count
                    .search_by_user_id(params[:user_id])
                    .page(params[:page]).per(5)
  end
end