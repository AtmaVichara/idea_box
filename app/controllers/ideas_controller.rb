class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update]

  def index
    @ideas = Idea.all
  end

  def show
  end

  def edit
  end

  def update
    @idea.update!(idea_params)
    flash[:success] = "You have updated #{@idea.title}"
    redirect_to idea_path(@idea)
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :body)
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end
end
