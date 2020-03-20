class AddRatingToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :rating, :integer, default: 0
  end
end
