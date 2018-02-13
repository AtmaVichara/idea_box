class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category.destroy!
    redirect_to categories_path
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end

end
