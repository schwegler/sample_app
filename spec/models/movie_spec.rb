require "rails_helper"

RSpec.describe Movie, type: :model do
  it "is valid with a title" do
    movie = Movie.new(title: "Inception")
    expect(movie).to be_valid
  end

  it "is invalid without a title" do
    movie = Movie.new(title: nil)
    expect(movie).to_not be_valid
  end
end
