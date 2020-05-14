class AddAverageRatingToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :average_rating, :float, default: 0.0
  end
end
