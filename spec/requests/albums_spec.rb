require 'spec_helper'

RSpec.describe "Albums", type: :request do
  describe "GET /albums" do
    it "works! (now write some real specs)" do
      get albums_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /albums" do
    it "creates a new album" do
      expect {
        post albums_path, params: { album: { title: "New Album" } }
      }.to change(Album, :count).by(1)
      expect(response).to redirect_to(Album.last)
    end
  end
end
