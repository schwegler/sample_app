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

    expect(filtered_params[:password]).to eq('[FILTERED]')
    expect(filtered_params[:secret]).to eq('[FILTERED]')
    expect(filtered_params[:token]).to eq('[FILTERED]')
    expect(filtered_params[:api_key]).to eq('[FILTERED]')
    expect(filtered_params[:crypt]).to eq('[FILTERED]')
    expect(filtered_params[:salt]).to eq('[FILTERED]')
    expect(filtered_params[:certificate]).to eq('[FILTERED]')
    expect(filtered_params[:otp]).to eq('[FILTERED]')
    expect(filtered_params[:ssn]).to eq('[FILTERED]')
    expect(filtered_params[:other]).to eq('safe_value')
  end
end
