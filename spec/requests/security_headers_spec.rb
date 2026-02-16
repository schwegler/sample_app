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
    end
  end
end
