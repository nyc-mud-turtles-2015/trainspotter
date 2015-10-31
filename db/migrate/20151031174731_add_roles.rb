class AddRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.references :curator, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true
      t.boolean :admin
      t.boolean :can_read
      t.boolean :can_create
      t.boolean :can_update
      t.boolean :can_invite
      t.timestamps null: false
    end
  end
end
