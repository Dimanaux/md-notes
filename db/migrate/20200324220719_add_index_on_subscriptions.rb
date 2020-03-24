class AddIndexOnSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_index :subscriptions, [:follower_id, :subscription_id], unique: true
  end
end
