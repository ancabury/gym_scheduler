class AddCronJob < ApplicationJob
  def initialize(user_id, scheduler)
    @user_id = user_id
    @scheduler = scheduler
  end

  def perform
    system "crontab -l ; echo \"#{cron_command_line}\" | crontab -"
  end

  private

  def cron_command_line
    "#{crontab_execution_time} #{crontab_command} > #{crontab_log}"
  end

  def crontab_execution_time
    "#{@scheduler.minute} #{@scheduler.hour} #{@scheduler.day_of_month} #{@scheduler.month} #{@scheduler.day_of_week}"
  end

  def crontab_command
    "cd #{Dir.pwd} ; #{load_rvm_command} ; rails runner app/scripts/execute_job.rb #{@user_id} #{@scheduler.gym_class_id}"
  end

  def load_rvm_command
    'source /Users/anca.sarbu/.rvm/environments/ruby-2.4.3@gym_scheduler'
  end

  def crontab_log
    File.join(Dir.pwd, 'log', 'cron.log')
  end
end
