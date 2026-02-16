class TvShowsController < ApplicationController
  def index
    @tv_shows = TvShow.all
  end

  def new
    @tv_show = TvShow.new
  end

  def create
    @tv_show = TvShow.new(tv_show_params)
    if @tv_show.save
      if params[:collection_id].present?
        collection = current_user.collections.find_by(id: params[:collection_id])
        CollectionItem.create(collection: collection, media_item: @tv_show) if collection
      end
      redirect_to @tv_show
    else
      render :new
    end
  end

  def show
    @tv_show = TvShow.find(params[:id])
  end

  private

  def tv_show_params
    params.require(:tv_show).permit(:title, :season, :episode, :network, :publication_date, :watched_on, :cover_art)
  end
end
