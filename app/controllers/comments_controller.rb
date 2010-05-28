class CommentsController < ApplicationController
  before_filter :authenticate, :only => [:update, :destroy]
  
  def index
    @comments = Comment.find(:all, :order => "created_at DESC")      
  end
  
  def create
    @comment = Comment.create!(params[:comment])
    flash[:notice] = "Gràcies per comentar!"
    @comment.request = request
    
    respond_to do |format|
      format.html { redirect_to episode_path(@comment.episode) }
      format.js 
    end
    
    rescue ActiveRecord::RecordInvalid
      @errors = true
      flash[:notice] = "Hi ha errors al comentari i no es publicarà. Verifica que has omplert TOTS els camps correctament."    

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
