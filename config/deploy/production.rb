server(
  ENV['MT_SERVER'], user: 'mytreasures', roles: %w(app db web)
)

set :rails_env, 'production'
set :rvm_type, :system
