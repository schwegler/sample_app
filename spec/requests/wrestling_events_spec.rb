# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WrestlingEvents', type: :request do
  describe 'GET /wrestling_events' do
    it 'works! (now write some real specs)' do
      get wrestling_events_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /wrestling_events/new' do
    context 'when not logged in' do
      it 'redirects to login path' do
        get new_wrestling_event_path
        expect(response).to redirect_to(login_path)
      end
      
  describe 'GET /wrestling_events/:id' do
    it 'renders the show template' do
      wrestling_event = WrestlingEvent.create!(title: 'WrestleMania')
      get wrestling_event_path(wrestling_event)
      expect(response).to have_http_status(200)
      expect(response.body).to include('WrestleMania')
    end
  end

  describe 'POST /wrestling_events' do
    context 'when logged in' do
      let(:user) do
        User.create!(name: 'Test User',
                     email: 'test@example.com',
                     password: 'password',
                     password_confirmation: 'password')
      end

      before do
        post login_path, params: { session: { email: user.email, password: user.password } }
      end

      it 'creates a new wrestling_event' do
        expect do
          post wrestling_events_path, params: { wrestling_event: { title: 'New Event' } }
        end.to change(WrestlingEvent, :count).by(1)
        expect(response).to redirect_to(WrestlingEvent.last)
      end
    end

    context 'when not logged in' do
      it 'redirects to login path' do
        post wrestling_events_path, params: { wrestling_event: { title: 'New Event' } }
        expect(response).to redirect_to(login_path)
      end

      it 'does not create a new event' do
        expect do
          post wrestling_events_path, params: { wrestling_event: { title: 'New Event' } }
        end.not_to change(WrestlingEvent, :count)
      end
    end
  end
end
