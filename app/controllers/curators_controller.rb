class CuratorsController < ApplicationController

  def show
    @curator = Curator.find(params[:id])
    @collections = @curator.collections
  end

  def profile
    @user = current_user
    render "show"
  end

end
