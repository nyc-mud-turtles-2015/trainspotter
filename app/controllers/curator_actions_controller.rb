class CuratorActionsController < ApplicationController

  before_action :not_logged_in?, only: [:new, :create, :destroy]

  private

  def not_logged_in?
    unless current_user
      redirect_to login_path
    end
  end

end
