class GymClass < ActiveRecord::Base
  has_one :scheduler

  validates_uniqueness_of :platform_id
end
