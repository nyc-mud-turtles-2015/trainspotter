class AddCurators < ActiveRecord::Migration
  def change
    create_table :curators do |t|
      t.string :uid
      t.string :username, null: false
      t.string :name
      t.string :avatar, default: "http://www.gravatar.com/avatar/?s=60&d=identicon"

      t.timestamps null: false
    end
  end
end
