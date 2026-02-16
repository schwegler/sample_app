# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'TvShows', type: :request do
  describe 'GET /tv_shows' do
    it 'works! (now write some real specs)' do
      get tv_shows_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /tv_shows' do
    it 'creates a new tv_show' do
      expect do
        post tv_shows_path, params: { tv_show: { title: 'New Show' } }
      end.to change(TvShow, :count).by(1)
      expect(response).to redirect_to(TvShow.last)
    end

    context 'with invalid parameters' do
      it 'does not create a new TvShow' do
        expect do
          post tv_shows_path, params: { tv_show: { title: '' } }
        end.to_not change(TvShow, :count)
      end

      it 'renders a response with 422 status' do
        post tv_shows_path, params: { tv_show: { title: '' } }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end
end
