class FavoriteIdeasController < ApplicationController

  before_action :set_idea

  def create
    if Favorite.create(favorited: @idea, user: current_user)
      redirect_to :back, notice: "Idea has been favorited."
    else
      redirect_to :back, alert: "Something went wrong!"
    end
  end

  def destroy
    Favorite.where(favorited_id: @idea.id, user_id: current_user.id).first.destroy
    redirect_to :back, notice: "Idea is no longer in favorites."
  end

  private

  def set_idea
    @idea = Idea.find(params[:idea_id] || params[:id])
  end
end
