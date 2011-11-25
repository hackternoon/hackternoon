# devise.rb
# ref:
# https://github.com/RailsApps/rails3-devise-rspec-cucumber/wiki/Tutorial
RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end
# Now you can write controller specs that set up a signed-in user before tests are run.

