class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :body)
    end

end
