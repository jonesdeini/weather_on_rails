require "bundler/capistrano"

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
  task :db_config, :except => { :no_release => true }, :role => :app do  
    run "cp -f ./config/database.yml #{release_path}/config/database.yml"  
  end
end  

namespace :deploy do
  task :precompile, :role => :app do
    run "cd #{release_path}/ && rake assets:precompile"
  end

  desc "restart thin"
  task :restart_thin do
    "thin restart -d"
  end
end
  
after "deploy:precompile", "db:db_config", "deploy:restart_thin"
#after "deploy:finalize_update", "deploy:precompile", "db:db_config"
#after "deploy:restart_thin"
