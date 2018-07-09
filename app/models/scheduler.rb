class Scheduler < ApplicationRecord
  belongs_to :gym_class

  validates :minute, cron: { inclusion: 0...60 }
  validates :hour, cron: { inclusion: 0...24 }
  validates :day_of_month, cron: { inclusion: 0..31 }
  validates :month, cron: { inclusion: 0..12 }

  enum day_of_week: [:*, :mon, :tues, :wed, :thu, :fri, :sat, :sun]
end
