require 'spec_helper'

RSpec.describe "TvShows", type: :request do
  describe "GET /tv_shows" do
    it "works! (now write some real specs)" do
      get tv_shows_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /tv_shows" do
    it "creates a new tv_show" do
      expect {
        post tv_shows_path, params: { tv_show: { title: "New Show" } }
      }.to change(TvShow, :count).by(1)
      expect(response).to redirect_to(TvShow.last)
    end
  end
end
