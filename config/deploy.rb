set :application, "amon"
set :deploy_to, "/home/deploy/app/#{application}"

role :app, "74.207.244.236"
role :web, "74.207.244.236"
role :db,  "74.207.244.236", :primary => true

default_run_options[:pty] = true
set :repository,  "git://github.com/spacecow/amon.git"
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

set :user, "deploy"
set :admin_runner, "deploy"

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  desc "Start Application -- not needed for Passenger"
  task :start, :roles => :app do
    # nothing -- need to override default cap start task when using Passenger
  end
end

namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{deploy_to}/shared/config/smtp_gmail.yml #{release_path}/config/smtp_gmail.yml"
    run "ln -nfs #{deploy_to}/shared/config/admin_authentication_config.yml #{release_path}/config/admin_authentication_config.yml"
    run "ln -nfs #{deploy_to}/shared/config/site_config.yml #{release_path}/config/site_config.yml"
  end
  
  desc "Sync the public/assets directory."
  task :assets do
    system "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{application}:#{shared_path}/"
  end
  # cap deploy:assets
end

after 'deploy:update_code', 'deploy:symlink_shared'