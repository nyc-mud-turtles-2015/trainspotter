class CuratorsController < ApplicationController

  def show
    @curator = Curator.find(params[:id])
    @collections = @curator.collections
  end

  def search
    @role = Role.new
    @collection = Collection.find(params[:collection_id])
    if request.xhr?
      @curators = Curator.search_curator(params[:c])
      render layout: false
    else
      @curators = Curator.search_curator(params[:c])
    end
  end

  def profile
    @user = current_user
    render "show"
  end
end
