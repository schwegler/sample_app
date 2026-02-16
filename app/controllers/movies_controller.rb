class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      if params[:collection_id].present?
        collection = current_user.collections.find_by(id: params[:collection_id])
        CollectionItem.create(collection: collection, media_item: @movie) if collection
      end
      redirect_to @movie
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director, :release_year, :rating, :publication_date, :watched_on, :cover_art)
  end
end
