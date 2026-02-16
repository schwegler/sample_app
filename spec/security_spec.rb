require 'rails_helper'

RSpec.describe "Security Configuration" do
  it "uses a secure Rails version" do
    # Rails 7.1.3 is the minimum version we want to allow based on the Gemfile
    expect(Gem::Version.new(Rails.version)).to be >= Gem::Version.new("7.1.3")
  end

  it "does not use Rails 4.0.4" do
    expect(Rails.version).not_to eq("4.0.4")
  end
end
