class AddPublishedAtToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :published_at, :datetime
  end
end
