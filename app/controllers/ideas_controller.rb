class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end

  def show
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "You have created a new idea"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @idea.update!(idea_params)
    flash[:success] = "You have updated #{@idea.title}"
    redirect_to idea_path(@idea)
  end

  def destroy
    @idea.destroy!
    flash[:success] = "You have deleted #{@idea.title}"
    redirect_to ideas_path
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :body)
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end
end
