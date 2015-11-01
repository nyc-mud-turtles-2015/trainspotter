class CuratorActionsController < ApplicationController

  before_action :logged_in?, only: [:new, :create, :destroy]

  private

  def logged_in?
    unless current_user
      redirect_to login_path
    end
  end

end
