class Public::Categories::QuizzesController < Public::Categories::ApplicationController
  def index
    @category = Category.find_by_slug(params[:category_slug])
    @quizzes  = @category.quizzes.page(params[:page]).per(10)
  end
end