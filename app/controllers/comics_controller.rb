# frozen_string_literal: true

class ComicsController < InventoryController
  before_action :logged_in_user, only: %i[new create]

  private

  def comic_params
    params.require(:comic).permit(:title, :issue_number, :publisher, :writer, :artist)
  end

  def resource_params
    comic_params
  end
end
