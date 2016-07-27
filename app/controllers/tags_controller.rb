class TagsController < ApplicationController
  before_action :set_tag, only: [:destroy, :show]
  def index
    @tag= Tag.all
  end

  def edit
    @tag= Tag.new
  end

  def update
    @tag = Tag.new(tag_params)
    if @tag.save
    else
    end
  end

  def show
    @list=@tag.listings
  end

  def destroy
    @tag.delete

  end

  private
  def tag_params
    params.require(:tag).permit(:tag)
  end
  def set_tag
    @tag = Tag.find(params[:id]) 
  end
end
