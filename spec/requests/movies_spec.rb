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
end
