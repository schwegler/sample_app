# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Users destroy', type: :request do
  let!(:user) do
    User.create!(name: 'Example User', email: 'user@example.com', password: 'password',
                 password_confirmation: 'password')
  end
  let!(:other_user) do
    User.create!(name: 'Other User', email: 'other@example.com', password: 'password',
                 password_confirmation: 'password')
  end
  let!(:admin) do
    User.create!(name: 'Admin User', email: 'admin@example.com', password: 'password',
                 password_confirmation: 'password', admin: true)
  end

  context 'as non-logged-in user' do
    it 'redirects to login path' do
      delete user_path(user)
      expect(response).to redirect_to(login_path)
    end

    it 'does not delete the user' do
      expect { delete user_path(user) }.not_to change(User, :count)
    end
  end

  context 'as non-admin user' do
    before do
      post login_path, params: { session: { email: other_user.email, password: other_user.password } }
    end

    it 'redirects to the root url' do
      delete user_path(user)
      expect(response).to redirect_to(root_url)
    end

    it 'does not delete the user' do
      expect { delete user_path(user) }.not_to change(User, :count)
    end
  end

  context 'as admin user' do
    before do
      post login_path, params: { session: { email: admin.email, password: admin.password } }
    end

    it 'deletes the user' do
      expect { delete user_path(user) }.to change(User, :count).by(-1)
    end

    it 'redirects to users index' do
      delete user_path(user)
      expect(response).to redirect_to(users_url)
    end
  end
end
