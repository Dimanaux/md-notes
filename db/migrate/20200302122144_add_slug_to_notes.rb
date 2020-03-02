class AddSlugToNotes < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :slug, :string
    add_index :notes, [:slug, :user_id], unique: true
  end
end
