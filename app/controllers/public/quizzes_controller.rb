class Public::QuizzesController < Public::ApplicationController
  def index
    @quizzes = Quiz.add_responses_count
                   .order(created_at: :desc)
                   .page(params[:page]).per(10)
  end

  def show
    @quiz = Quiz.find(params[:id])
    impressionist(@quiz, nil, :unique => [:session_hash])
    @page_views = @quiz.impressionist_count
    @response = @quiz.responses.new
  end
end