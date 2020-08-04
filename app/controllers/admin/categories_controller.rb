class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @quizzes  = Category.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end


end