# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'login page' do
    before { get login_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'contains Log in text' do
      expect(response.body).to include('Log in')
    end
  end

  describe 'valid login' do
    let(:user) do
      User.create(name: 'Example User', email: 'user@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    before do
      post login_path, params: { session: { email: user.email, password: user.password } }
    end

    it 'redirects to the user page' do
      expect(response).to redirect_to(user)
    end

    it 'logs the user in' do
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe 'invalid login' do
    before { post login_path, params: { session: { email: 'user@example.com', password: 'invalid' } } }

    it 'renders the new template' do
      expect(response.body).to include('Log in')
    end

    it 'displays an error message' do
      expect(response.body).to include('Invalid email/password combination')
    end
  end

  describe 'logout' do
    let(:user) do
      User.create(name: 'Example User', email: 'user@example.com', password: 'password',
                  password_confirmation: 'password')
    end

    before do
      post login_path, params: { session: { email: user.email, password: user.password } }
      delete logout_path
    end

    it 'redirects to root' do
      expect(response).to redirect_to(root_url)
    end

    it 'logs the user out' do
      expect(session[:user_id]).to be_nil
    end
  end
end
