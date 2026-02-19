# frozen_string_literal: true

class WrestlingEventsController < InventoryController
  before_action :logged_in_user, only: %i[new create]
  private

  def wrestling_event_params
    params.require(:wrestling_event).permit(:title, :promotion, :date, :venue)
  end

  def resource_params
    wrestling_event_params
  end
end
