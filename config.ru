require './config/environment'
require 'sidekiq/web'

use Rack::Session::Cookie, secret: ENV['SESSIONS_SECRET']

use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'user:email, repo'
end

map '/admin/sidekiq' do
  run Sidekiq::Web
end

run Hanami.app
