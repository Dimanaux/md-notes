class AddUniqueIndexToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_index :subscriptions, [:follower_id, :followee_id], unique: true
  end
end
