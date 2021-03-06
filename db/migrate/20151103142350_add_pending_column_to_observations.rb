class AddPendingColumnToObservations < ActiveRecord::Migration
    def up
      add_column :observations, :pending, :boolean, default: true
    end

    def down
      remove_column :observations, :pending
    end
end
