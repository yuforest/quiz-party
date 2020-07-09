class Public::QuizzesController < Public::ApplicationController
  def index
    @quizs = Quiz.all
  end
end