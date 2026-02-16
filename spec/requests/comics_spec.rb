require 'spec_helper'

RSpec.describe "Comics", type: :request do
  describe "GET /comics" do
    it "works! (now write some real specs)" do
      get comics_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /comics" do
    it "creates a new comic" do
      expect {
        post comics_path, params: { comic: { title: "New Comic" } }
      }.to change(Comic, :count).by(1)
      expect(response).to redirect_to(Comic.last)
    end
  end
end
