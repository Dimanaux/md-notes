class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
