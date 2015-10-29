  class ObservationsController < ApplicationController

  def index
    @observations = Observation.all
  end

  def create
    @observation = Observation.new(valid_params)
    if @observation.save
    else
      flash[:errors] = "Error"
      redirect_to new_observation_path
    end
    redirect_to observations_path
  end

  def show
    @observation = Observation.find(params[:id])
  end


  def valid_params
    params.require(:observation).permit(:description,:curator_id,:image, :collection_id)
  end

end