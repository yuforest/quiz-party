class Public::ResponsesController < Public::ApplicationController
  def index
    @quiz = Quiz.find(params[:quiz_id])
    @responses = @quiz.responses
                      .includes(quiz: [:answers])
                      .page(params[:page]).per(20)
    @page_views = @quiz.impressionist_count
  end

  def create
    @quiz = Quiz.find(response_params[:quiz_id])
    @response = Response.new(response_params)
    @answers = @quiz.answers
    @is_correct = is_correct
    if @response.save
      render 'create.js.erb'
    end
  end

  private
  def response_params
    params.require(:response).permit(:quiz_id, :content, :name)
  end

  def is_correct
    @answers.map{ |answer|
      return true if answer.content == @response.content
    }
    false
  end
end