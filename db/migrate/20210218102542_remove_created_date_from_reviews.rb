class RemoveCreatedDateFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :creation_date
  end
end
