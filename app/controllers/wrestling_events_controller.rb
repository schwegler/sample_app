class WrestlingEventsController < ApplicationController
  def index
    @wrestling_events = WrestlingEvent.all
  end

  def new
    @wrestling_event = WrestlingEvent.new
  end

  def create
    @wrestling_event = WrestlingEvent.new(wrestling_event_params)
    if @wrestling_event.save
      if params[:collection_id].present?
        collection = current_user.collections.find_by(id: params[:collection_id])
        CollectionItem.create(collection: collection, media_item: @wrestling_event) if collection
      end
      redirect_to @wrestling_event
    else
      render :new
    end
  end

  def show
    @wrestling_event = WrestlingEvent.find(params[:id])
  end

  private

  def wrestling_event_params
    params.require(:wrestling_event).permit(:title, :promotion, :date, :venue, :watched_on, :cover_art)
  end
end
