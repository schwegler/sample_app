# frozen_string_literal: true

class AlbumsController < ApplicationController
  before_action :logged_in_user, only: %i[create new]
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
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
    params.require(:album).permit(:title, :artist, :release_year, :genre)
  end
end
