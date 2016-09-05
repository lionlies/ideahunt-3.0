class IdeasController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def show
    @idea = Idea.find(params[:id])
  end

  def index
    if params[:tag]
      @ideas = Idea.tagged_with(params[:tag]).order("favorites_count desc")
    else
      @ideas = Idea.order("favorites_count desc")
    end
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id

    if @idea.save
      redirect_to ideas_path
    else
      render :new
    end
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea = current_user.ideas.find(params[:id])

    if @idea.update(idea_params)
      redirect_to ideas_path
    else
      render :edit
    end
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.destroy
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :tag_list)
  end
end
