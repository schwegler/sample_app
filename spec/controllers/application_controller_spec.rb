# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def create
      render plain: 'Hello'
    end
  end

  before do
    ActionController::Base.allow_forgery_protection = true
  end

  after do
    ActionController::Base.allow_forgery_protection = false
  end

  it 'raises InvalidAuthenticityToken when CSRF token is missing' do
    expect do
      post :create
    end.to raise_error(ActionController::InvalidAuthenticityToken)
  end
end
