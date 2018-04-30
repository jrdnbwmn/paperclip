class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.where(user_id: current_user)
    @user = current_user
    @categories = @user.categories.order(:name)
  end

  def show
    @documents = Document.where(user_id: current_user)
    @user = current_user
    @categories = @user.categories.order(:name)
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end

end
