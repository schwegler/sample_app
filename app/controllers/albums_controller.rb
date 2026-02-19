# frozen_string_literal: true

class AlbumsController < InventoryController
  before_action :logged_in_user, only: %i[new create]

  def index
    @albums = Album.page(params[:page])
  end

  private

  def album_params
    params.require(:album).permit(:title, :artist, :release_year, :genre)
  end

  def resource_params
    album_params
  end
end
