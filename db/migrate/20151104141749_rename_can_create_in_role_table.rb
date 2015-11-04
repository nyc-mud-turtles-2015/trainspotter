class RenameCanCreateInRoleTable < ActiveRecord::Migration

  def up
    rename_column :roles, :can_create, :can_add
  end

  def down
    rename_column :roles, :can_add, :can_create
  end

end
