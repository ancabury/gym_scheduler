# use "# scheduler.cron_name" to identify lines and delete them
class DeleteCronJob
  def initialize(scheduler)
    @scheduler = scheduler
  end

  def perform
    system "(crontab -l | grep -v #{@scheduler.cron_name}) | crontab -"
  end
end
