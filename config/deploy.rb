# config valid only for current version of Capistrano
lock '3.9.0'

set :application, 'mytreasures'
set :repo_url, ENV['MT_REPO_URL']
set :deploy_to, ENV['MT_DEPLOY_TO']

append(
  :linked_files,
  '.env'
)
# Default value for linked_dirs is []
append(
  :linked_dirs,
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'public/system'
)

if ENV['MT_ROLLBAR_TOKEN'].present?
  set :rollbar_token, ENV['MT_ROLLBAR_TOKEN']
  set :rollbar_env, (proc { fetch :stage })
  set :rollbar_role, (proc { :app })
end

set :keep_releases, 5
set :passenger_restart_with_touch, true
