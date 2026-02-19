# frozen_string_literal: true

class MoviesController < InventoryController
  private

  def movie_params
    params.require(:movie).permit(:title, :director, :release_year, :rating)
  end

  def resource_params
    movie_params
  end
end
