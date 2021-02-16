class AddDescriptionToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :description, :text
  end
end
