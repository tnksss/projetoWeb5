set :stage, :production

server '104.131.114.76', roles: %w(app web db), primary: true, user: 'deployer'
set :rails_env, "production"
