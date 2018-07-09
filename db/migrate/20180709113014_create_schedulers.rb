class CreateSchedulers < ActiveRecord::Migration[5.2]
  def change
    create_table :schedulers do |t|
      t.references :gym_class
      t.string :minute, default: '*'
      t.string :hour, default: '*'
      t.string :day_of_month, default: '*'
      t.string :month, default: '*'
      t.integer :day_of_week, default: '*'

      t.timestamps
    end
  end
end
