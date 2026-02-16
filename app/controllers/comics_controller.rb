class ComicsController < ApplicationController
  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to @comic
    else
      render :new
    end
  end

  def show
    @comic = Comic.find(params[:id])
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :issue_number, :publisher, :writer, :artist)
  end
end
