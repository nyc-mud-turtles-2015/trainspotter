class CollectionsController < ApplicationController

  before_action :redirect_if_not_logged_in, only: [:new, :create, :permissions, :destroy, :edit, :update]

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
      redirect_to new_collection_observation_path(@collection)
    else
      flash[:error] = "Collection cannot be saved!"
      redirect_to new_collection_path
    end
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
    if collection.owned_by?(current_user)
      collection.observations.delete_all
      collection.roles.delete_all
      collection.destroy
      redirect_to collections_path
    else
      flash[:error] = "You are not authorized to delete this collection"
      redirect_to collection_path(collection)
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.owned_by?(current_user)
      if @collection.update_attributes(valid_params)
       redirect_to collection_permissions_path(@collection)
       flash[:notice] = "Update successful!"
      else
        flash[:errors] = "Collection update failed. Please try again. Note: only owner of collection can update it."
        redirect_to collection_permissions_path(@collection)
      end
    else
      flash[:error] = "You are not authorized to edit this collection"
      redirect_to collection_path(@collection)
    end
  end

  def index
     @collections = Collection.paginate(page: params[:page], per_page: 10).order('updated_at DESC')
  end

  private

  def valid_params
    params.require(:collection).permit(:title, :is_private, :description).merge({curator_id: current_user.id})
  end

end
