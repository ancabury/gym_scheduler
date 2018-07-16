class AddClassIdToGymClass < ActiveRecord::Migration[5.2]
  def change
    add_column :gym_classes, :class_id, :integer
  end
end
