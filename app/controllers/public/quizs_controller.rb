class Public::QuizsController < Public::ApplicationController
  def index
    @quizs = Quiz.all
  end
end