class CommentsController < ApplicationController
  before_filter :authenticate, :only => [:update, :edit, :destroy]
  
  def index
    @comments = Comment.all
    respond_to do |format|
      format.html
      format.rss
    end
  end

  def new
    @comment = Comment.new
    if !request.xhr?
      @comments = Comment.all
    end

    respond_to do |format|
      format.html
      format.js {render :layout => false}
    end
  end

  def create
    @comment = Comment.create(params[:comment])
    respond_to do |format|
      format.html { redirect_to episode_path }
      format.js {render :layout => false}
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.save

    respond_to do |format|
      format.html { redirect_to episode_path }
      format.js {render :layout => false}
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to episode_path }
      format.js {render :layout => false}
    end
  end
end
