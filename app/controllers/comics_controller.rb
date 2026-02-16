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
      if params[:collection_id].present?
        collection = current_user.collections.find_by(id: params[:collection_id])
        CollectionItem.create(collection: collection, media_item: @comic) if collection
      end
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
    params.require(:comic).permit(:title, :issue_number, :publisher, :writer, :artist, :publication_date, :read_on, :cover_art)
  end
end
