class AddPaperclipToObservation < ActiveRecord::Migration
  def up
    add_attachment :observations, :image
  end

  def down
    remove_attachment :observations, :image
  end
end
