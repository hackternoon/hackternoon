source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'pg'
gem 'jquery-rails'
gem 'devise',     '~> 1.5.2'
gem 'haml-rails', '~> 0.3.4'
gem 'slim',   '~> 1.0.4'
gem 'thin',   '~> 1.3.1'
gem 'foreman','~> 0.27.0'

group :test, :development do
  gem 'ruby-debug19', :require => 'ruby-debug'
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
  gem "rspec-rails", "~> 2.7.0"
  gem 'capybara'
  gem "cucumber-rails", "~> 1.2.1"
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'haml2slim', '~> 0.4.6'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end
