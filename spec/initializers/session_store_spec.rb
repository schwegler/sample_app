# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session store initializer', type: :initializer do
  it 'configures the session store' do
    expect(Rails.application.config.session_store).to eq(ActionDispatch::Session::CookieStore)
  end
end
