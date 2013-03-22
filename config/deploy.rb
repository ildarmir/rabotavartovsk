require "bundler/capistrano"
default_run_options[:pty] = true

set :application, "rabotavartovsk"
set :repository,  "git@github.com:ildarmir/rabotavartovsk.git"
set :deploy_via, :copy
set :user, "hosting_typus"
set :deploy_to, "set :deploy_via, :copy
set :user, "hosting_typus"
set :deploy_to, "/projects/rabotavsurgute/releases/"
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "fluorine.locum.ru"
role :app, "your app-server here"                          # This may be the same as your `Web` server
role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

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
