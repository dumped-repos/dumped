source 'https://rubygems.org'

gem 'bootsnap', require: false

gem 'rake'
gem 'hanami',       '1.2.0.beta2'
gem 'hanami-model', '1.2.0.beta2'
gem 'hanami-pagination'

gem 'pg'

gem 'slim'
gem 'sass'

gem 'http'

gem 'omniauth'
gem 'omniauth-github'

gem 'sidekiq'
gem 'sinatra', require: false

gem 'dry-system'
gem 'dry-system-hanami', github: 'davydovanton/dry-system-hanami'

gem 'foreman'

group :plugins do
  gem 'hanami-reloader'
end

group :development do
  gem 'hanami-webconsole'
  gem 'pry-byebug'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem "codeclimate-test-reporter"
  gem 'rspec-hanami'
  gem 'webmock'
end

group :production do
  # gem 'puma'
end
