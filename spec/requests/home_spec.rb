require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "displays recent media" do
      album = Album.create!(title: "Recent Album", artist: "Artist", release_year: 2024, genre: "Rock")
      get root_path
      expect(response.body).to include("Recent Album")
    end
  end
end
