class UpdateGymClassesJob
  def initialize
    @data = GetGymClasses.new.perform
  end

  def perform
    @data = @data[:days].each do |day, classes|
      all_classes = classes['classes'].values.flatten
      all_classes.each do |gym_class_attrs|
        next if gym_class_attrs['name'] == 'filler'
        next unless date_not_in_range(gym_class_attrs['date'])

        gym_class = GymClass.find_or_initialize_by(
          name: gym_class_attrs['name'],
          day_of_week: GymClass.day_of_weeks[day]
        )

        gym_class.update!(attributes_for(gym_class_attrs))
      end
    end

    p '========================================='
    p '===== Gym classes have been updated ====='
    p '========================================='
  end

  private

  def attributes_for(gym_class_attr)
    interval = gym_class_attr['interval'].gsub(/ /, '').split('-')
    {
      name: gym_class_attr['name'],
      start_at: interval.first,
      end_at: interval.last,
      day_of_week: parse_day_of_week(gym_class_attr[:date]),
      trainer: gym_class_attr[:trainer],
      class_id: gym_class_attr[:id]
    }
  end

  def parse_day_of_week(data)
    day = data.to_date.strftime("%A").downcase
    GymClass.day_of_weeks[day]
  end

  def date_not_in_range(data)
    date = data.to_date
    week_start = Date.today.at_beginning_of_week
    week_end = week_start + 6.days

    week_start <= date && date <= week_end
  end
end
