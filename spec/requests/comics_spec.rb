# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Comics', type: :request do
  describe 'GET /comics' do
    it 'works! (now write some real specs)' do
      get comics_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /comics/new' do
    context 'when not logged in' do
      it 'redirects to login path' do
        get new_comic_path
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'POST /comics' do
    context 'when not logged in' do
      it 'redirects to login path' do
        post comics_path, params: { comic: { title: 'Unauthorized Comic' } }
        expect(response).to redirect_to(login_path)
      end

      it 'does not create a comic' do
        expect do
          post comics_path, params: { comic: { title: 'Unauthorized Comic' } }
        end.not_to change(Comic, :count)
      end
    end

    context 'when logged in' do
      let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password', password_confirmation: 'password') }

      before do
        post login_path, params: { session: { email: user.email, password: user.password } }
      end

      it 'creates a new comic' do
        expect do
          post comics_path, params: { comic: { title: 'Authorized Comic' } }
        end.to change(Comic, :count).by(1)
        expect(response).to redirect_to(Comic.last)
      end
    end
  end
end
