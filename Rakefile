task :default => [:run]

task :run do
  system 'mongod --fork --logpath mongodb.log'
  system 'shotgun config.ru'
end
