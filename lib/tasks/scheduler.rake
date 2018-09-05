desc "This task will be run every night at 21:00. It will create bookings to gym classes"
task :create_booking => :environment do
  Scheduler.all.each do |schedule|
    if schedule.any_day_of_week? || WEEK_DAYS[schedule.day_of_week.to_sym] == DateTime.now.wday
      user = schedule.user
      gym_class = schedule.gym_class

      next if user.nil? || gym_class.nil?
      system("sh app/scripts/gym_scheduler.sh #{user.email} #{user.decoded_password } #{gym_class.platform_id}")

      p '========================================='
      p '========= Booking created for: =========='
      p "class: #{gym_class.name}"
      p "user: #{user.name}"
      p '========================================='
    end
  end
end
