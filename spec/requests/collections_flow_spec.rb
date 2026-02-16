require 'rails_helper'

RSpec.describe "Collections Flow", type: :request do
  let!(:user) { User.create!(email: "guest@example.com", encrypted_password: "password") }

  before do
    # Ensure our stubbed current_user is this user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "Collection Management" do
    it "allows creating a new collection" do
      get new_collection_path
      expect(response).to have_http_status(:success)

      expect {
        post collections_path, params: { collection: { name: "My Favs" } }
      }.to change(Collection, :count).by(1)

      expect(response).to redirect_to(collection_path(Collection.last))
      follow_redirect!

      expect(response.body).to include("My Favs")
      expect(user.collections.count).to eq(1)
    end
  end

  describe "Adding Media to Collection" do
    let!(:collection) { Collection.create!(name: "To Watch", user: user) }

    it "adds a new movie to the collection" do
      movie_params = {
        title: "New Movie",
        director: "Director",
        release_year: 2024,
        rating: "PG-13"
      }

      expect {
        post movies_path, params: { movie: movie_params, collection_id: collection.id }
      }.to change(Movie, :count).by(1)
      .and change(CollectionItem, :count).by(1)

      new_movie = Movie.last
      expect(collection.collection_items.last.media_item).to eq(new_movie)
    end

    it "adds a new album to the collection" do
      album_params = {
        title: "New Album",
        artist: "Artist",
        release_year: 2024,
        genre: "Pop"
      }

      expect {
        post albums_path, params: { album: album_params, collection_id: collection.id }
      }.to change(Album, :count).by(1)
      .and change(CollectionItem, :count).by(1)

      new_album = Album.last
      expect(collection.collection_items.last.media_item).to eq(new_album)
    end
  end
end
