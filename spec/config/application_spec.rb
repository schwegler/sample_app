require 'rails_helper'

RSpec.describe SampleApp::Application do
  it "boots the application successfully" do
    expect(Rails.application).to be_a(Rails::Application)
    expect(Rails.application.initialized?).to be true
  end
end
