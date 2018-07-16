class GymClassDayOfWeekInteger < ActiveRecord::Migration[5.2]
  def change
    add_column :gym_classes, :day_of_week_int, :integer
    GymClass.all.each do |gym_class|
      gym_class.update(day_of_week_int: GymClass.day_of_weeks[gym_class.day_of_week&.downcase])
    end

    remove_column :gym_classes, :day_of_week, :integer
    rename_column :gym_classes, :day_of_week_int, :day_of_week
  end
end
