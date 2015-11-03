class CollectionsController < ApplicationController

  def welcome
    @collections = Collection.order(updated_at: :desc)
  end

  def index
    @collections = Collection.order(updated_at: :desc)
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
    @search_term = params[:c]
    @collections = Collection.search_collection(@search_term)
  end

  def permissions
    @collection = Collection.find(params[:id])
  end

  def destroy
    session[:return_to] ||= request.referer
    collection = Collection.find(params[:id])
    collection.observations.delete_all
    collection.roles.delete_all
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

  def index
     @collections = Collection.paginate(page: params[:page], per_page: 10)
  end

  private

  def valid_params
    params.require(:collection).permit(:title, :is_private, :description).merge({curator_id: current_user.id})
  end

end
