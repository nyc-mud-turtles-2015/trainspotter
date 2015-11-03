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
    observation = collection.observations.build(observation_params)
    if observation.save
      if collection.user_can_add?(current_user)
        observation.pending = false
        observation.save
        flash[:notice] = "Your sighting has been added."
      else
        flash[:notice] = "Your sighting has been sent to #{collection.curator.public_name} for approval."
      end
    else
      flash[:errors] = "Whoops! There was an error. Please try again"
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
    Observation.find(params[:id]).destroy
    redirect_to collection_path(collection)
  end

  private

  def observation_params
    params.require(:observation).permit(:description,:image, :collection_id).merge({curator_id: current_user.id})
  end

end
