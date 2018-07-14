class AddUsertoScheduler < ActiveRecord::Migration[5.2]
  def change
    add_column :schedulers, :user_id, :integer
  end
end
