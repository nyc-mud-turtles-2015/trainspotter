class AddCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title, null: false
      t.text :description
      t.references :curator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
