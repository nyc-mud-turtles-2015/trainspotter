class AddColumnUsernameToCurators < ActiveRecord::Migration
  def up
    add_column :curators, :username, :string
  end

  def down
    remove_column :curators, :username
  end
end
