class RemoveColumnsFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :admin
    remove_column :roles, :can_read
    remove_column :roles, :can_create
    remove_column :roles, :can_update
    remove_column :roles, :can_invite
    add_column :roles, :permissions_id, :integer
  end

  def down
    add_column :roles, :admin, :boolean
    add_column :roles, :can_read, :boolean
    add_column :roles, :can_invite, :boolean
    add_column :roles, :can_update, :boolean
    add_column :roles, :can_create, :boolean
    remove_column :roles, :permissions_id
  end
end
