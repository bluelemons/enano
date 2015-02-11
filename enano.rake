namespace :enano do

  @latest_ruby = 'ruby-2.2.0'
  @name = ENV['NAME'] || '/'
  @templates = "#{ ENV['HOME'] }/.rake/templates"

  directory @name

  desc 'generate gemset file, optional argument gemset name'
  file '.ruby-gemset' => @name do
    sh "echo #{ @name } > #{ @name }/.ruby-gemset"
  end

  desc 'generate ruby version file, optional argument ruby version'
  file '.ruby-version' => @name do
    sh "echo #{ @latest_ruby } > #{ @name }/.ruby-version"
  end

  task :new => ['.ruby-gemset', '.ruby-version']

  desc 'Install a custom Cuba app'
  task :cuba do
    sh "rsync -ru #{ @templates }/cuba/ ."
    sh 'git init'
    sh 'gem install dep'
    dep = ['rubocop',
           'cuba',
           'cutest',
           'pry']
    dep.each { |gem| sh "dep add #{ gem }" }
    sh 'dep install'
  end
end
