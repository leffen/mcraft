set :stages, %w(production)
set :default_stage, "dev"

require 'capistrano/ext/multistage'

require "bundler/capistrano" # pulls in the bundler cap task
require "capistrano_colors"

set :application, "mcraft"

set :scm, :git
set :repository, "git@github.com:leffen/mcraft.git"
set :branch, "master"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true
default_run_options[:shell] = false
set :use_sudo, false

#Needed to get correct env for rbenv
default_run_options[:shell] = '/bin/bash --login'


load "config/recipes/linux_common"
load 'deploy/assets'

namespace :deploy do

  before "deploy:cold" do
    run "#{sudo} chown -R #{user}.#{group} #{deploy_to}"
  end

  desc "Symlinks shared config files"
  task :symlink_config, :roles => :web do
    ['config/settings.yml', 'config/database.yml','config/thin.yml','.env'].each do |file_name|
      shared_config_file = "#{deploy_to}/shared/#{file_name}"
      if remote_file_exists?(shared_config_file)
        run "rm -f #{release_path}/#{file_name}"
        run "ln -nfs #{shared_config_file} #{release_path}/#{file_name}"
      end
    end
  end

  desc "Setup the database."
  task :db_setup, roles: :app do
    run "cd #{current_path} && bundle exec rake db:setup RAILS_ENV=#{rails_env}"
  end


  # Thin processes management.
  # TODO: Add foreman support for Thin.
  desc "Start the services."
  task :start, roles: :app, except: {no_release: true} do
    run "cd #{current_path} && RAILS_ENV=production bundle exec thin start -C ./config/thin.yml"
  end

  desc "Stop the services."
  task :stop, roles: :app, except: {no_release: true} do
    run "cd #{current_release} && bundle exec thin stop -C ./config/thin.yml || exit 0"
  end

  desc "Restart the services."
  task :restart, roles: :app, except: {no_release: true} do
    run "cd #{current_path} && RAILS_ENV=production  bundle exec thin restart -C ./config/thin.yml || exit 0"
  end

  desc "Deploys and starts a 'cold' application."
  task :cold do
    update
    db_setup
    migrate
    start
  end


end

#before "deploy",            "deploy:symlink_config"
before "deploy:migrations", "deploy:symlink_config"
before "deploy:db_setup",   "deploy:symlink_config"
after "deploy", "deploy:cleanup" # keep only the last 5 releases
after "deploy:finalize_update", "deploy:symlink_config"
after "deploy:update_code", "deploy:migrate"