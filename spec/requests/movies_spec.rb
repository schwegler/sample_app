# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Movies', type: :request do
  describe 'GET /movies' do
    it 'works! (now write some real specs)' do
      get movies_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /movies' do
    it 'creates a new movie' do
      expect do
        post movies_path, params: { movie: { title: 'New Movie' } }
      end.to change(Movie, :count).by(1)
      expect(response).to redirect_to(Movie.last)
    end
  end

  describe 'GET /movies/:id' do
    context 'with a valid movie' do
      let!(:movie) { Movie.create!(title: 'Inception') }

      it 'returns a success response and displays the movie title' do
        get movie_path(movie)
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Inception')
      end
    end

    context 'with an invalid movie id' do
      it 'returns a not found response' do
        get movie_path('0')
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
