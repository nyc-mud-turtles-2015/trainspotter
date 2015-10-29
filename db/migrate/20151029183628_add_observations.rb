class AddObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.references :curator, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true
      t.string :image
      t.text  :description

      t.timestamps null: false
    end
  end
end
