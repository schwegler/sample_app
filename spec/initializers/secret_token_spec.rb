# frozen_string_literal: true

require 'spec_helper'
require 'tmpdir'
require 'fileutils'

describe 'secure_token' do
  let(:temp_root) { Pathname.new(Dir.mktmpdir) }
  let(:token_file) { temp_root.join('.secret') }

  before do
    # Mock Rails.root to use a temporary directory
    allow(Rails).to receive(:root).and_return(temp_root)
  end

  after do
    # Clean up the temporary directory
    FileUtils.remove_entry temp_root
  end

  it 'generates a new token when .secret does not exist' do
    token = secure_token
    expect(token).to match(/\A[0-9a-f]{128}\z/)
    expect(File.exist?(token_file)).to be true
    expect(File.read(token_file).chomp).to eq(token)
  end

  it 'returns the existing token when .secret exists' do
    File.write(token_file, 'existing_token')
    expect(secure_token).to eq('existing_token')
  end

  it 'does not overwrite an existing token' do
    File.write(token_file, 'original_token')
    secure_token
    expect(File.read(token_file).chomp).to eq('original_token')
  end
end
