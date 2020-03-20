class DropRatingFromNotes < ActiveRecord::Migration[5.1]
  def change
    remove_column :notes, :rating
  end
end
