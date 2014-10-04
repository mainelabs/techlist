source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.1'

gem 'active_model_serializers'
gem 'aasm'
gem 'coffee-rails'
gem 'delayed_job_active_record'
gem 'email_validator'
gem 'ember-rails'
gem 'ember-source'
gem 'emblem-rails'
gem 'foundation-rails', '~> 5.0'
gem 'geocoder'
gem 'high_voltage'
gem 'jquery-rails'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '~> 4.1.0'
gem 'rails_admin'
gem 'rails-assets-gabesmed--ember-leaflet'
gem 'recipient_interceptor'
gem 'sass-rails', '~> 4.0.3'
gem 'simple_form'
gem 'thor'
gem 'thor-rails'
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
  gem 'rspec-rails', '~> 2.14.0'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
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
