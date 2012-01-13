#$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
#require "rvm/capistrano"                  # Load RVM's capistrano plugin.
#set :rvm_ruby_string, '1.9.3@weather_on_rails'        # Or whatever env you want it to run in.

require "bundler/capistrano"

set :application, "weather_on_rails"
set :repository,  "git@github.com:jones-deini/weather_on_rails.git"

set :scm, "git"
set :user, "ec2-user"

#role :web, "jonesdeini.com"                          # Your HTTP server, Apache/etc
#role :app, "jonesdeini.com"                          # This may be the same as your `Web` server
#role :db,  "jonesdeini.com", :primary => true # This is where Rails migrations will run

role :web, "184.73.157.166"                          # Your HTTP server, Apache/etc
role :app, "184.73.157.166"                          # This may be the same as your `Web` server
role :db,  "184.73.157.166", :primary => true # This is where Rails migrations will run

set :branch, "master"

set :deploy_via, :remote_cache

ssh_options[:forward_agent] = true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
