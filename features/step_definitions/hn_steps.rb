# hn_steps.rb

And /^debug$/ do
  debugger
  p 'debugger called'
end

And /^I_confirm$/ do
  @usr = User.find_by_email 'user@test.com'
  @token = @usr.confirmation_token
  @cpath = "/users/confirmation?confirmation_token=#{@token}"
  visit @cpath
end

And /^saop$/ do
  save_and_open_page
end
