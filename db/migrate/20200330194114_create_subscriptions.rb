class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :follower, foreign_key: { to_table: :users, index: false }
      t.references :followee, foreign_key: { to_table: :users, index: false }

      t.timestamps

      t.index [:followee_id, :follower_id], unique: true
    end
  end
end
