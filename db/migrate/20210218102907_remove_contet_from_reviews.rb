class RemoveContetFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :contet
  end
end
