# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application configuration', type: :config do
  it 'boots the application successfully' do
    expect(Rails.application).to be_a(Rails::Application)
  end
end
