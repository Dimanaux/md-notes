class AddRatingCountToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :rating_count, :integer, default: 0
  end
end
