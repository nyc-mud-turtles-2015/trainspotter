  class ObservationsController < ApplicationController

  before_action :redirect_if_not_logged_in, only: [:new, :create, :update, :destroy]

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
    observation.curator_id = current_user.id
    if observation.save
      if collection.user_can_add?(current_user)
        observation.pending = false
        observation.save
        flash[:notice] = "Your sighting has been added."
      else
        flash[:notice] = "Your sighting has been sent to #{collection.curator.public_name} for approval."
      end
    else
      flash[:notice] = "Make sure you add at least a description or photo."
    end
    redirect_to collection
  end

  def show
    @observation = Observation.find(params[:id])
  end

  def edit
    @collection = Collection.find(params[:collection_id])
    @observation = Observation.find(params[:id])
  end

  def update
    collection = Collection.find(params[:collection_id])
    observation = Observation.find(params[:id])
    if collection.owned_by?(current_user)
      observation.pending = false
      observation.update_attributes(observation_params)
      observation.save
    else
      flash[:error] = "You are not authorized to update sightings on this collection"
    end
    redirect_to collection_path(collection)
  end

  def destroy
    @collection = Collection.find(params[:collection_id ])
    observation = Observation.find(params[:id])
    if @collection.owned_by?(current_user) || observation.owned_by?(current_user)
      observation.destroy
    else
      flash[:error] = "You are not authorized to delete sightings on this collection"
    end
    if request.xhr?
      render 'collections/show'
    else
      redirect_to collection_path(@collection)
    end
  end

  private

  def observation_params
    params.require(:observation).permit(:description,:image, :collection_id)#.merge({curator_id: current_user.id})
  end

end
