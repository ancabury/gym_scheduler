class CreateGymClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_classes do |t|
      t.string :name
      t.string :day_of_week
      t.datetime :start_at
      t.datetime :end_at
      t.integer :platform_id

      t.timestamps
    end
  end
end
