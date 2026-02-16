# frozen_string_literal: true

class WrestlingEventsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]
  def index
    @wrestling_events = WrestlingEvent.all
  end

  def new
    @wrestling_event = WrestlingEvent.new
  end

  def create
    @wrestling_event = WrestlingEvent.new(wrestling_event_params)
    if @wrestling_event.save
      redirect_to @wrestling_event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @wrestling_event = WrestlingEvent.find(params[:id])
  end

  private

  def wrestling_event_params
    params.require(:wrestling_event).permit(:title, :promotion, :date, :venue)
  end
end
