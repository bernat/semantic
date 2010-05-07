class CommentsController < ApplicationController
  before_filter :authenticate, :only => [:update, :destroy]
  


  def create
    @comment = Comment.create!(params[:comment])
    flash[:notice] = "Gràcies per comentar!"
    respond_to do |format|
      format.html { redirect_to episode_path(@comment.episode) }
      format.js 
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.save

    respond_to do |format|
      format.html { redirect_to episode_path(@comment.episode) }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to episode_path(@comment.episode) }
      format.js 
    end
  end
end
