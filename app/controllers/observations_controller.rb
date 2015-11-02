  class ObservationsController < ApplicationController

  def index
    @observations = Observation.order(updated_at: :desc)
  end

  def new
    @collection = Collection.find(params[:collection_id])
    @observation = Observation.new
  end

  def create
    collection = Collection.find(params[:collection_id])
    observation = Observation.new(observation_params)
    if observation.save
      if pending_param[:pending] == "true"
        PendingObservation.create(observation_id: observation.id)
      end
    else
      flash[:errors] = "Error"
    end
    redirect_to collection
  end

  def show
    @observation = Observation.find(params[:id])
  end

  def update
    collection = Collection.find(params[:collection_id])
    observation = Observation.find(params[:id])
    observation.pending_observation.destroy
    redirect_to collection_path(collection)
  end

  def destroy
    collection = Collection.find(params[:collection_id ])
    observation = Observation.find(params[:id])
    if observation.is_pending?
      observation.pending_observation.destroy
    end
    observation.destroy
    redirect_to collection_path(collection)
  end

  private

  def observation_params
    params.require(:observation).permit(:description,:curator_id,:image, :collection_id)
  end

  def pending_param
    params.require(:observation).permit(:pending)
  end

end
