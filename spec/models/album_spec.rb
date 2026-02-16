require 'spec_helper'

RSpec.describe Album, type: :model do
  it "is valid with a title" do
    album = Album.new(title: "Thriller")
    expect(album).to be_valid
  end

  it "is invalid without a title" do
    album = Album.new(title: nil)
    expect(album).to_not be_valid
  end
end
