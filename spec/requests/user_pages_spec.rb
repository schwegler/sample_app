# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'User pages', type: :request do # rubocop:disable Metrics/BlockLength
  let!(:user) do
    User.create!(name: 'Example User', email: 'user@example.com', password: 'password',
                 password_confirmation: 'password')
  end

  describe 'index' do
    context 'when not logged in' do
      it 'redirects to login' do
        get users_path
        expect(response).to redirect_to(login_path)
      end
    end

    context 'as non-admin user' do
      before do
        post login_path, params: { session: { email: user.email, password: user.password } }
        get users_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'does not show delete links' do
        expect(response.body).not_to include('>delete</a>')
      end
    end

    context 'as admin user' do
      let!(:admin) do
        User.create!(name: 'Admin User', email: 'admin@example.com', password: 'password',
                     password_confirmation: 'password', admin: true)
      end

      before do
        post login_path, params: { session: { email: admin.email, password: admin.password } }
        get users_path
      end

      it 'shows delete links' do
        expect(response.body).to include('>delete</a>')
      end

      it 'deletes another user' do
        expect { delete user_path(user) }.to change(User, :count).by(-1)
      end
    end
  end

  describe 'show' do
    it 'returns http success' do
      post login_path, params: { session: { email: user.email, password: user.password } }
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(user.name)
    end

    it 'redirects to login when not logged in' do
      get user_path(user)
      expect(response).to redirect_to(login_path)
    end
  end
end
