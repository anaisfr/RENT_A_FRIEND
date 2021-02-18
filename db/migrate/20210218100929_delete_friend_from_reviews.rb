class DeleteFriendFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :friend, foreign_key: true
  end
end
