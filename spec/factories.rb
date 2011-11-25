# factories.rb
# ref:
# https://github.com/RailsApps/rails3-devise-rspec-cucumber/wiki/Tutorial

require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end
