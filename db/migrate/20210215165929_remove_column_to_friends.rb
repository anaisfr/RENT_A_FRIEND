class RemoveColumnToFriends < ActiveRecord::Migration[6.0]
  def change
    remove_column :friends, :friend_avatar, :text
  end
end
