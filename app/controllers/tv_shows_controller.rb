# frozen_string_literal: true

class TvShowsController < InventoryController
  private

  def tv_show_params
    params.require(:tv_show).permit(:title, :season, :episode, :network)
  end

  def resource_params
    tv_show_params
  end
end
