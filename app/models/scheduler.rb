class Scheduler < ApplicationRecord
  belongs_to :gym_class
  has_one    :user

  validates :minute, cron: { inclusion: 0...60 }
  validates :hour, cron: { inclusion: 0...24 }
  validates :day_of_month, cron: { inclusion: 0..31 }
  validates :month, cron: { inclusion: 0..12 }

  enum day_of_week: [:*, :mon, :tues, :wed, :thu, :fri, :sat, :sun]

  def cron_time
    "#{minute} #{hour} #{day_of_month} #{month} #{day_of_week}"
  end

  def cron_name
    "#{gym_class.id}_#{gym_class.name.parameterize.underscore}"
  end

  def any_day_of_week?
    day_of_week == '*'
  end
end
