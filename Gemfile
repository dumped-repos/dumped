source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '1.2.0.beta2'
gem 'hanami-model', '1.2.0.beta2'

gem 'pg'

gem 'slim'
gem 'sass'

gem 'http'

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
end

group :production do
  # gem 'puma'
end
