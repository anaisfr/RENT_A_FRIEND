class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.string :city
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.text :friend_avatar

      t.timestamps
    end
  end
end
