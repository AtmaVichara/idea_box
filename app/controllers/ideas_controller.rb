class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit]

  def index
    @ideas = Idea.all
  end

  def show
  end

  def edit
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :body)
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end
end
