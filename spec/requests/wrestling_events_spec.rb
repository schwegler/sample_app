# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'WrestlingEvents', type: :request do
  describe 'GET /wrestling_events' do
    it 'works! (now write some real specs)' do
      get wrestling_events_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /wrestling_events' do
    it 'creates a new wrestling_event' do
      expect do
        post wrestling_events_path, params: { wrestling_event: { title: 'New Event' } }
      end.to change(WrestlingEvent, :count).by(1)
      expect(response).to redirect_to(WrestlingEvent.last)
    end
  end
end
