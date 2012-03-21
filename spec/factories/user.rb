# I use this file to make @user via factory girl:
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
# This will guess the User class
FactoryGirl.define do
  factory :user do
    name  'Dan MentalBot'
    email 'dan@cnn.com'
    password 'abc123'
    password_confirmation 'abc123'
    twitter_handle '@mentalbot'
    location 'Calif'
  end
end
