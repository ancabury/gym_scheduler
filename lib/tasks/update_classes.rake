desc 'This task will be run every night at 20:00. It will update the details for each class.'
task :update_classes => :environment do
  UpdateGymClassesJob.new.perform
  p '========================================='
  p '====== Classes have been updated ========'
end
