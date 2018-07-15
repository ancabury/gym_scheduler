class AddUserScheduleRelation < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :scheduler_id, :integer
  end
end
