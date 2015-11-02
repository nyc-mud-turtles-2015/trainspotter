class CreatePendingObservations < ActiveRecord::Migration
  def change
    create_table :pending_observations do |t|
      t.references :observation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
