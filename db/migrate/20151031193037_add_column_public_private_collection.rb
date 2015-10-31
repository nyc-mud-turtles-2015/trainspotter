class AddColumnPublicPrivateCollection < ActiveRecord::Migration
  def up
    add_column :collections, :private, :boolean
  end

  def down
    remove_column :collections, :private
  end
end
