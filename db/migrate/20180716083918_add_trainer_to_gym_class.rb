class AddTrainerToGymClass < ActiveRecord::Migration[5.2]
  def change
    add_column :gym_classes, :trainer, :string
  end
end
