class CollectionsController < ApplicationController

  def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection= Collection.new(valid_params)
    if @collection.save
    else
      flash[:errors] = "Collection cannot be saved!"
      redirect_to new_collection_path
    end
    redirect_to collections_path
  end

  def show
    @collection= Collection.find(params[:id])
  end


  def valid_params
    params.require(:collection).permit(:title,:curator_id)
  end

end