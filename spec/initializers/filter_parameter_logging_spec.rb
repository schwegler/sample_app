# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Filter Parameter Logging' do
  it 'filters sensitive parameters from logs' do
    parameter_filter = ActiveSupport::ParameterFilter.new(Rails.application.config.filter_parameters)

    sensitive_params = {
      password: 'secret_password',
      secret: 'secret_value',
      token: 'secret_token',
      api_key: 'secret_key',
      crypt: 'secret_crypt',
      salt: 'secret_salt',
      certificate: 'secret_certificate',
      otp: 'secret_otp',
      ssn: 'secret_ssn',
      other: 'safe_value'
    }

    filtered_params = parameter_filter.filter(sensitive_params)

    expect(filtered_params.values_at(
             :password, :secret, :token, :api_key, :crypt, :salt, :certificate, :otp, :ssn
           )).to all(eq('[FILTERED]'))
    expect(filtered_params[:other]).to eq('safe_value')
  end
end
