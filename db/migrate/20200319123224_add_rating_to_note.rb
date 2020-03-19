class AddRatingToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :rating, :float, default: 0.0
  end
end
