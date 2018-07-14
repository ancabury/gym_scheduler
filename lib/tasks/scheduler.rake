desc "This task will be run every night at 00:00. It will create bookings to gym classes"
task :create_booking => :environment do
  Scheduler.all do |schedule|
    if schedule.any_day_of_week? || WEEK_DAYS[schedule.day_of_week.to_sym] == DateTime.now.wday
      user = schedule.user
      gym_class = schedule.gym_class
      system("sh app/scripts/gym_scheduler.sh #{user.email} #{user.decoded_password } #{gym_class.platform_id}")
    end
  end
end
