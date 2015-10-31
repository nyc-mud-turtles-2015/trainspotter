  class ObservationsController < ApplicationController

  def index
    @observations = Observation.all
  end

  def new
    @collection = Collection.find(params[:collection_id])
    @observation = Observation.new
  end

  def create
    collection = Collection.find(params[:collection_id])
    @observation = Observation.new(valid_params)
    if @observation.save
    else
      flash[:errors] = "Error"
    end
    redirect_to collection
  end

  def show
    @observation = Observation.find(params[:id])
  end


  def valid_params
    params.require(:observation).permit(:description,:curator_id,:image, :collection_id)
  end

  def destroy
    collection = Collection.find(params[:collection_id ])
    Observation.find(params[:id]).destroy
    redirect_to collection_path(collection)
  end

end
