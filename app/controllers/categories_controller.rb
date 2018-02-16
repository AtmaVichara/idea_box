class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :user_logged_in?

  def show
  end

  def index
    @categories = Category.all
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end

end
