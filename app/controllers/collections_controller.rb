class CollectionsController < ApplicationController
  def index
    @collections = current_user.collections
  end

  def show
    @collection = current_user.collections.find(params[:id])
    @items = @collection.collection_items.includes(:media_item)
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      redirect_to @collection, notice: 'Collection was successfully created.'
    else
      render :new
    end
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end
