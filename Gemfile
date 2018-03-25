source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '1.2.0.beta2'
gem 'hanami-model', '1.2.0.beta2'

gem 'pg'

gem 'http'

group :plugin do
  gem 'hanami-reloader'
end

group :development do
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'rspec'
  gem 'capybara'
  gem "codeclimate-test-reporter"
end

group :production do
  # gem 'puma'
end
