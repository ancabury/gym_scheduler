class UpdateGymClassesJob
  def initialize
    @data = GetGymClasses.new.perform
    @data = @data[:classes].map(&:with_indifferent_access)
  end

  def perform
    @data.each do |gym_class_attributes|
      gym_class = GymClass.find_or_initialize_by(
        class_id: gym_class_attributes[:classid],
        day_of_week: gym_class_attributes[:dayofweek].downcase)
      gym_class.update!(attributes_for(gym_class_attributes))
    end

    p '========================================='
    p '===== Gym classes have been updated ====='
    p '========================================='
  end

  private

  def attributes_for(gym_class_attr)
    {
      platform_id: gym_class_attr[:id],
      name: gym_class_attr[:bookingname],
      start_at: gym_class_attr[:start_str],
      end_at: gym_class_attr[:end_str],
      day_of_week: gym_class_attr[:dayofweek].downcase
    }
  end

  def parse_day_of_week(data)
    GymClass.day_of_weeks[data]
  end
end
