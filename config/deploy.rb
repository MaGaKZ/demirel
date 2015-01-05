set :application, 'demirel'
set :repo_url, 'git@github.com:magakz/demirel.git'
set :scm, :git
set :branch, "master"
set :deploy_to, '/home/deploy/demirel'
set :rbenv_ruby, '2.1.3'
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :deploy_via, :copy

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end