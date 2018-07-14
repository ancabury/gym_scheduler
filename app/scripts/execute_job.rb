user_id = ARGV[0]
gym_class_id = ARGV[1]

return if user_id.nil? || gym_class_id.nil?

user = User.find user_id
gym_class = GymClass.find gym_class_id

system("sh app/scripts/gym_scheduler.sh #{user.email} #{user.decoded_password } #{gym_class.platform_id}")
