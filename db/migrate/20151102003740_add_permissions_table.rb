class AddPermissionsTable < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :level_name, null: false
      t.integer :level_number, null: false, uniqueness: true
      t.timestamps null: false
  end
end
