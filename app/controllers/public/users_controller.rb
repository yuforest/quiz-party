class Public::UsersController < Public::ApplicationController
  def show
    @user = User.find(params[:id])
    @quizzes = @user.quizzes.page(params[:page]).per(5)
  end
end