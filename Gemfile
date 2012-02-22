source 'https://rubygems.org'

gem 'rails',     '3.2.0'
gem 'pg',         '~> 0.12.0'
gem 'jquery-rails', '~> 2.0.0'
gem 'thin',       '~> 1.3.1'
gem 'foreman',    '~> 0.39.0'
gem 'haml',       '~> 3.1.4'
gem 'haml-rails', '~> 0.3.4'
gem 'slim',       '~> 1.1.0'

group :test, :development do
  gem 'ruby-debug19', '~> 0.11.6',:require => 'ruby-debug'
  # Pretty printed test output
  gem 'turn', '0.9.3', :require => false
  gem 'haml2slim',   '~> 0.4.6'
  gem 'rspec-rails', '~> 2.8.1'
  gem 'capybara',    '~> 1.1.2'
  gem 'database_cleaner', '~> 0.7.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end
