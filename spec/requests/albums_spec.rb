# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Albums', type: :request do
  describe 'GET /albums' do
    it 'works! (now write some real specs)' do
      get albums_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /albums' do
    it 'creates a new album' do
      expect do
        post albums_path, params: { album: { title: 'New Album' } }
      end.to change(Album, :count).by(1)
      expect(response).to redirect_to(Album.last)
    end
  end

  describe 'GET /albums/:id' do
    let!(:album) { Album.create!(title: 'Test Album', artist: 'Test Artist') }

    it 'returns http success' do
      get album_path(album)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Test Album')
    end
  end
end
