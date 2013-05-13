require 'bundler/capistrano'
before "deploy:update_code", :copy_database_config, :copy_production_config
task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end
task :copy_production_config, roles => :app do
  pr_config = "#{shared_path}/production.rb"
  run "cp #{pr_config} #{release_path}/config/environments/production.rb"
end
load 'deploy/assets'
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :application,     "rabotavsurgute"
set :deploy_server,   "fluorine.locum.ru"
set :user,            "hosting_tapir"
set :login,           "tapir"
set :use_sudo,        false
set :deploy_to,       "/home/#{user}/projects/#{application}"
set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{application}.#{login}.pid"
set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
role :web,            deploy_server
role :app,            deploy_server
role :db,             deploy_server, :primary => true
set :rvm_ruby_string, "1.9.3"
set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake" 
set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"
set :scm,             :git
set :repository,      "git@github.com:ildarmir/rabotavartovsk.git"
# set :repository,    "git@github.com:username/project.git"
before 'deploy:finalize_update', 'set_current_release'
task :set_current_release, :roles => :app do
set :current_release, latest_release
end
set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end
  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end
  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end

