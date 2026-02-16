class HomeController < ApplicationController
  def index
    @recent_items = (
      Album.order(created_at: :desc).limit(10) +
      Comic.order(created_at: :desc).limit(10) +
      Movie.order(created_at: :desc).limit(10) +
      TvShow.order(created_at: :desc).limit(10) +
      WrestlingEvent.order(created_at: :desc).limit(10)
    ).sort_by(&:created_at).reverse.first(20)
  end
end
