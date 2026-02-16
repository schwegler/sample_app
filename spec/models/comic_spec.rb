# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Comic, type: :model do
  it 'is valid with a title' do
    comic = Comic.new(title: 'Spider-Man')
    expect(comic).to be_valid
  end

  it 'is invalid without a title' do
    comic = Comic.new(title: nil)
    expect(comic).to_not be_valid
  end
end
