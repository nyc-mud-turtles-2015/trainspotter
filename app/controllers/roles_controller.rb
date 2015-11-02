class RolesController < ApplicationController

  def create
    if existing_role = Role.find_by(curator_id: params[:curator_id], collection_id: params[:collection_id])
      if existing_role.destroy
      else
          flash[:errors] = "Error"
      end
    end
    role = Role.new
    if role.save
    else
      flash[:errors] = "Error"
    end
    redirect_to controller: 'collections', action: 'permissions', id: params[:collection_id]
  end


  def valid_params
    params.permit(:curator_id, :collection_id, :role)
  end
end
