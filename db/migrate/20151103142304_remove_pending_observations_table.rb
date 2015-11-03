class RemovePendingObservationsTable < ActiveRecord::Migration
    def up
      drop_table :pending_observations
    end

    def down
      create_table :pending_observations do |t|
        t.references :observation, index: true, foreign_key: true

        t.timestamps null: false
      end
    end
end
