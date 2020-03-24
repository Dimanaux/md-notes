class CreateSubscriptionsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table "subscriptions", force: true, id: false do |t|
      t.integer "follower_id", null: false
      t.integer "subscription_id", null: false
    end
  end
end
