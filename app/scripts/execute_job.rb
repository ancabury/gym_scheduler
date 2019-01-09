user_id = ARGV[0]
gym_class_id = ARGV[1]

return if user_id.nil? || gym_class_id.nil?

user = User.find_by id: user_id
gym_class = GymClass.find_by id: gym_class_id


return if user.nil? || gym_class.nil?

system("sh app/scripts/gym_scheduler.sh #{user.subscription_id} #{gym_class.class_id}")
