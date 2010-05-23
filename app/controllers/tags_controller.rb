class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:id])
    @episodes = @tag.episodes
  end
end
