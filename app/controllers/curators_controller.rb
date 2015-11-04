class CuratorsController < ApplicationController

  before_action :redirect_if_not_logged_in, only: [:update]

  def show
    @curator = Curator.find(params[:id])
    @collections = @curator.collections.order(updated_at: :desc)
  end

  def search
    @curators = Curator.search_curator(params[:c])
  end

  def profile
    @user = current_user
    render "show"
  end

  def update
    @curator = Curator.find(current_user.id)
    if @curator.update_attributes(valid_params)
      redirect_to curator_path(@curator)
    else
      flash[:errors] = "Username is already taken! Please try another name."
      redirect_to curator_path(@curator)
    end
  end

  private

  def valid_params
    params.require(:curator).permit(:username)
  end
end
