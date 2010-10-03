class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => :destroy

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      flash[:notice] = "Gràcies per comentar!"
    else
      flash[:alert] = "Hi ha errors al comentari i no es publicarà. Verifica que has omplert TOTS els camps correctament."
    end

    respond_to do |format|
      format.html { redirect_to @comment.commentable }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @comment.commentable }
      format.js 
    end
  end
end
