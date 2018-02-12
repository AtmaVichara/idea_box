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
    @idea = current_user.idea.new(idea_params)
    if @idea.save
      flash[:success] = "You have created a new idea"
      redirect_to user_idea_path(@idea.user)
    else
      flash[:alert] = "Something went wrong. Try again!!"
      render :new
    end
  end

  def edit
  end

  def update
    @idea.update!(idea_params)
    flash[:success] = "You have updated #{@idea.title}"
    redirect_to user_idea_path(@idea.user)
  end

  def destroy
    @idea.destroy!
    flash[:success] = "You have deleted #{@idea.title}"
    redirect_to user_path(@idea.user)
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :body, :category_id)
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end
end
