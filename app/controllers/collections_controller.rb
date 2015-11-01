class CollectionsController < ApplicationController

  def welcome
    @collections = Collection.all
  end

  def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(valid_params)
    if @collection.save
    else
      flash[:errors] = "Collection cannot be saved!"
      redirect_to new_collection_path
    end
    redirect_to new_collection_observation_path(@collection)
  end

  def show
    @collection= Collection.find(params[:id])
  end

  def search
    @collections = Collection.search_collection(params[:c])
  end

  def permissions
    @collection = Collection.find(params[:id])
  end

  def destroy
    session[:return_to] ||= request.referer
    collection = Collection.find(params[:id])
    collection.observations.each { |o| o.destroy }
    collection.destroy
    redirect_to session.delete(:return_to)
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update_attributes(valid_params)
    if @collection.save
    else
      flash[:errors] = "Collection cannot be saved!"
      redirect_to root_path
    end
    redirect_to collection_permissions_path(@collection)
  end

  private

  def valid_params
    params.require(:collection).permit(:title,:curator_id, :private, :description)
  end

end
