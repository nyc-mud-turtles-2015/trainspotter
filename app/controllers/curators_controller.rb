class CuratorsController < ApplicationController

  def show
    @curator = Curator.find(params[:id])
    @collections = @curator.collections
  end

  def search
    @curators = Curator.search_curator(params[:c])
    if request.xhr?
      render "search", layout: false
    else
      render "search"
    end
  end

  def profile
    @user = current_user
    render "show"
  end

end
