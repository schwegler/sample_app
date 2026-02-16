require 'spec_helper'

RSpec.describe "User pages", type: :request do

  describe "index" do
    let!(:user) { User.create(name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password") }

    describe "as non-admin user" do
      before do
        post login_path, params: { session: { email: user.email, password: user.password } }
        get users_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "does not show delete links" do
        expect(response.body).not_to include(">delete</a>")
      end
    end

    describe "as admin user" do
      let!(:admin) { User.create(name: "Admin User", email: "admin@example.com", password: "password", password_confirmation: "password", admin: true) }

      before do
        post login_path, params: { session: { email: admin.email, password: admin.password } }
        get users_path
      end

      it "shows delete links" do
        expect(response.body).to include(">delete</a>")
      end

      it "should be able to delete another user" do
        expect {
          delete user_path(user)
        }.to change(User, :count).by(-1)
      end
    end
  end
end
