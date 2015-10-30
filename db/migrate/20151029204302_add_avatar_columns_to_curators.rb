class AddAvatarColumnsToCurators < ActiveRecord::Migration
  def up
    add_attachment :curators, :avatar
  end

  def down
    remove_attachment :curators, :avatar
  end
end
