require 'spec_helper'

RSpec.describe WrestlingEvent, type: :model do
  it "is valid with a title" do
    event = WrestlingEvent.new(title: "WrestleMania")
    expect(event).to be_valid
  end

  it "is invalid without a title" do
    event = WrestlingEvent.new(title: nil)
    expect(event).to_not be_valid
  end
end
