class CuratorsController < ApplicationController

  def show
    @curator = Curator.find(params[:id])
  end

  def profile
    @user = current_user
    render "show"
  end

end
