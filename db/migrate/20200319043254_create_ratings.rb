class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.references :note, foreign_key: true
      t.integer :value

      t.timestamps

      t.index [:user_id, :note_id], unique: true
    end
  end
end
