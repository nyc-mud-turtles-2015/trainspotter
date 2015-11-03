class RenamePrivateFieldInCollectionTable < ActiveRecord::Migration

  def up
    rename_column :collections, :private, :is_private
  end

  def down
    rename_column :collections, :is_private, :private
  end

end
