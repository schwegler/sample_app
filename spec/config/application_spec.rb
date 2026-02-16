# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SampleApp::Application do
  it 'boots the application successfully' do
    expect(Rails.application).to be_present
    expect(Rails.application.initialized?).to be true
  end
end
