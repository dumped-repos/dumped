require './config/environment'

use Rack::Session::Cookie, secret: ENV['SESSIONS_SECRET']

use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'user:email, repo'
end

run Hanami.app
