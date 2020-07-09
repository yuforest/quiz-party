class User::QuizsController < User::ApplicationController
  before_action :set_quiz, only: [:edit, :update, :destroy]
  def index
    @quizs = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizs.new(quiz_params)
    if @quiz.save
      flash[:notice] = '登録しました'
      redirect_to user_quizs_path
    else
      flash[:alert] = '登録できませんでした'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      flash[:notice] = '更新しました'
      redirect_to user_quizs_path
    else
      flash[:alert] = '更新できませんでした'
      render 'new'
    end
  end

  def destroy
    @quiz.destroy
    @post.destroy
    flash[:notice] = '削除しました'
    redirect_to user_posts_path
  end

  private
  def quiz_params
    params.require(:quiz).permit(:content, :category_id, :image)
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
