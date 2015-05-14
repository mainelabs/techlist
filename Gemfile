source 'https://rubygems.org'

ruby '2.2.2'

gem 'active_model_serializers'
gem 'aasm'
gem 'bitters'
gem 'bourbon'
gem 'coffee-rails'
gem 'delayed_job_active_record'
gem 'devise'
gem 'email_validator'
gem 'font-awesome-rails'
gem 'geocoder'
gem 'high_voltage'
gem 'jquery-rails'
gem 'kaminari'
gem 'neat'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '~> 4.1.0'
gem 'rails_admin'
gem 'rails_admin-i18n'
gem 'recipient_interceptor'
gem 'sass-rails', '~> 4.0.3'
gem 'simple_form'
gem 'thor'
gem 'thor-rails'
gem 'turbolinks'
gem 'uglifier'
gem 'unicorn'

group :development do
  gem 'foreman'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0.0'
end

group :test do
  gem 'capybara-webkit', '>= 1.2.0'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.7.3'
  gem 'rails_12factor'
end
