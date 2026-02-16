# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session Store Configuration' do
  it 'configures the session store with the secure flag based on the environment' do
    # This test verifies that the `secure` option is set to match Rails.env.production?
    # In the test environment, Rails.env.production? is false, so secure should be false.
    # Before the fix, secure is nil (missing), so this test will fail.
    # After the fix, secure will be false, so this test will pass.

    session_options = Rails.application.config.session_options
    expect(session_options[:secure]).to eq(Rails.env.production?)
  end
end
