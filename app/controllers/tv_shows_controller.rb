# frozen_string_literal: true

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
      redirect_to @tv_show
    else
      render :new, status: :unprocessable_content
    end
  end

  def show
    @tv_show = TvShow.find(params[:id])
  end

  private

  def tv_show_params
    params.require(:tv_show).permit(:title, :season, :episode, :network)
  end
end
