require 'rubocop/rake_task'

task default: %w(test rubocop)

task :test do
  ruby 'test.rb'
end

task :rubocop do
  RuboCop::RakeTask.new
end
