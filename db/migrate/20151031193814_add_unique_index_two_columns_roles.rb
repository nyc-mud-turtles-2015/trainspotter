class AddUniqueIndexTwoColumnsRoles < ActiveRecord::Migration
  def up
    add_index :roles, [:curator_id, :collection_id], unique: true
    remove_index :roles, :collection_id
    remove_index :roles, :curator_id
  end

  def down
    remove_index :roles, column: [:curator_id, :collection_id]
    add_index :roles, :curator_id
    add_index :roles, :collection_id
  end
end
