require 'rails_helper'

RSpec.describe Collection, type: :model do
  let(:user) { User.create(email: "test@example.com", encrypted_password: "password") }
  let(:collection) { Collection.new(name: "Favorites", user: user) }

  it "is valid with valid attributes" do
    expect(collection).to be_valid
  end

  it "is not valid without a name" do
    collection.name = nil
    expect(collection).to_not be_valid
  end

  it "is not valid without a user" do
    collection.user = nil
    expect(collection).to_not be_valid
  end
end
