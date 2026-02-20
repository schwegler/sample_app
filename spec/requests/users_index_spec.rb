# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Users index', type: :request do # rubocop:disable Metrics/BlockLength
  let!(:user) do
    User.create!(name: 'Example User', email: 'user@example.com', password: 'password',
                 password_confirmation: 'password')
  end

  describe 'GET /users' do # rubocop:disable Metrics/BlockLength
    context 'when not logged in' do
      it 'redirects to login path' do
        get users_path
        expect(response).to redirect_to(login_path)
      end

      it 'sets a flash message' do
        get users_path
        expect(flash[:danger]).to eq('Please log in.')
      end
    end

    context 'when logged in as non-admin' do
      before do
        post login_path, params: { session: { email: user.email, password: user.password } }
        get users_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'displays the user list' do
        expect(response.body).to include(user.name)
      end

      it 'does not show delete links' do
        expect(response.body).not_to include('delete</a>')
      end
    end

    context 'when logged in as admin' do
      let!(:admin) do
        User.create!(name: 'Admin User', email: 'admin@example.com', password: 'password',
                     password_confirmation: 'password', admin: true)
      end

      before do
        post login_path, params: { session: { email: admin.email, password: admin.password } }
        get users_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'shows delete links' do
        expect(response.body).to include('delete</a>')
      end
    end

    context 'pagination' do
      before do
        30.times do |n|
          User.create!(name: "User #{n}", email: "user-#{n}@example.com", password: 'password',
                       password_confirmation: 'password')
        end
        post login_path, params: { session: { email: user.email, password: user.password } }
        get users_path
      end

      it 'shows pagination links' do
        expect(response.body).to include('class="pagination"')
      end

      it 'lists each user' do
        User.paginate(page: 1).each do |u|
          expect(response.body).to include(u.name)
        end
      end
    end
  end
end
