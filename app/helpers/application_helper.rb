module ApplicationHelper
  def convert_to_time(date)
    date.strftime("%I:%M%p")
  end

  def schedule_to_s(scheduler)
    "#{scheduler.minute} #{scheduler.hour} #{scheduler.day_of_month} #{scheduler.month}\
     #{scheduler.day_of_week}"
  end
end
