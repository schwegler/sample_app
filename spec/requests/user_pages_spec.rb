# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'User pages', type: :request do
  describe 'index' do
    let!(:user) do
      User.create!(name: 'Example User', email: 'user@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    describe 'as non-admin user' do
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

    describe 'as admin user' do
      let!(:admin) do
        User.create!(name: 'Admin User', email: 'admin@example.com', password: 'password', password_confirmation: 'password',
                    admin: true)
      end

      before do
        post login_path, params: { session: { email: admin.email, password: admin.password } }
        get users_path
      end

      it 'shows delete links' do
        expect(response.body).to include('>delete</a>')
      end

      it 'should be able to delete another user' do
        expect do
          delete user_path(user)
        end.to change(User, :count).by(-1)
      end
    end
  end

  describe 'show' do
    let(:user) do
      User.create!(name: 'Example User', email: 'user@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    context 'when logged in' do
      before do
        post login_path, params: { session: { email: user.email, password: user.password } }
        get user_path(user)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'displays the user name' do
        expect(response.body).to include(user.name)
      end
    end

    context 'when not logged in' do
      before { get user_path(user) }

      it 'redirects to login' do
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
