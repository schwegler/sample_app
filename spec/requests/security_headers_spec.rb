# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Security Headers', type: :request do
  describe 'Permissions-Policy' do
    it 'sets the Feature-Policy header' do
      get login_path
      # Rails 7.1 uses Feature-Policy header name for compatibility
      expect(response.headers['Feature-Policy']).to include("camera 'none'")
      expect(response.headers['Feature-Policy']).to include("gyroscope 'none'")
      expect(response.headers['Feature-Policy']).to include("microphone 'none'")
      expect(response.headers['Feature-Policy']).to include("usb 'none'")
      expect(response.headers['Feature-Policy']).to include("fullscreen 'self'")
      expect(response.headers['Feature-Policy']).to include("payment 'none'")
      
  describe 'GET /' do
    it 'sets the Content-Security-Policy header' do
      get root_path
      expect(response.headers['Content-Security-Policy']).to be_present
    end

    it "includes default-src 'self' https:" do
      get root_path
      csp = response.headers['Content-Security-Policy']
      expect(csp).to include("default-src 'self' https:")
    end

    it 'includes a nonce for scripts' do
      get root_path
      csp = response.headers['Content-Security-Policy']
      expect(csp).to match(%r{script-src 'self' https: 'nonce-[a-zA-Z0-9+/=]+'})
    end
  end
end
