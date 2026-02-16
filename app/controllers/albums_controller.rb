class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      if params[:collection_id].present?
        collection = current_user.collections.find_by(id: params[:collection_id])
        CollectionItem.create(collection: collection, media_item: @album) if collection
      end
      redirect_to @album
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :release_year, :genre, :publication_date, :listened_on, :cover_art)
  end
end
