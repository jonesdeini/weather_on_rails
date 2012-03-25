require "bundler/capistrano"
load 'deploy/assets'

set :application, "weather_on_rails"
set :deploy_to, "/var/www/weather_on_rails"

set :scm, :git
set :repository,  "git@github.com:jonesdeini/weather_on_rails.git"
set :branch, "master"

set :location, "184.73.157.166"
role :app, location
role :web, location
role :db, location

set :user, "root"
set :deploy_via, :remote_cache
#ssh_options[:keys] = [File.join(ENV["HOME"], "ssh", "id_rsa")]
ssh_options[:keys] = ["#{ENV['HOME']}/r0bj0n3s99.pem"]
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
default_run_options[:shell] = false

namespace :db do  
  task :db_config, :except => { :no_release => true }, :roles => :app do  
    run "cp -f ~/weather_on_rails/config/database.yml #{release_path}/config/database.yml"  
  end
end  

namespace :deploy do
  task :precompile, :roles => :app do
    run "cd #{release_path}/ && bundle exec rake assets:precompile"
  end

  desc "symlink database.yml"
  task :symlnk, :roles => :app do
    run "cp -f #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end

  task :restart, :roles => :app do
    run "thin restart -d"
  end
end
  
#after "deploy:restart", "db:config"
after "deploy:update_code", "deploy:symlnk"
#after "deploy:finalize_update", "deploy:precompile", "db:db_config"
#after "deploy:restart_thin"
