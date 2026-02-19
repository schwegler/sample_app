# frozen_string_literal: true

class TvShowsController < InventoryController
  def index
    @tv_shows = TvShow.page(params[:page])
  end

  private

  def tv_show_params
    params.require(:tv_show).permit(:title, :season, :episode, :network)
  end

  def resource_params
    tv_show_params
  end
end
