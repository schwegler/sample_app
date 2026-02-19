# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'WrestlingEvents Pagination', type: :request do
  before do
    WrestlingEvent.delete_all
    30.times do |i|
      WrestlingEvent.create!(title: "Event #{i}", promotion: "Promo", date: Date.today, venue: "Venue")
    end
  end

  it 'displays the first page of wrestling events' do
    get wrestling_events_path
    expect(response).to have_http_status(200)

    # Default is 25 per page.
    # We expect 25 items on page 1.
    expect(response.body).to include("Event 0")
    expect(response.body).to include("Event 24")
    expect(response.body).not_to include("Event 25")

    # Check for pagination links
    expect(response.body).to include('<nav class="pagination"')
    expect(response.body).to include('rel="next"')
  end

  it 'displays the second page of wrestling events' do
    get wrestling_events_path(page: 2)
    expect(response).to have_http_status(200)

    # We expect the remaining 5 items on page 2.
    expect(response.body).not_to include("Event 0")
    expect(response.body).to include("Event 25")
    expect(response.body).to include("Event 29")

    # Check for pagination links
    expect(response.body).to include('<nav class="pagination"')
    expect(response.body).to include('rel="prev"')
  end
end
