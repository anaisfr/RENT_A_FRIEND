class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :contet
      t.date :creation_date
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
