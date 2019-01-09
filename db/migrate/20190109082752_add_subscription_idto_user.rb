class AddSubscriptionIdtoUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscription_id, :integer, default: 0
  end
end
