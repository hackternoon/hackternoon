### UTILITY METHODS ###
def valid_user
  @user ||= { :name => "Bob McUserton", :email => "bob@cnn.com",
    :password => "abc123", :password_confirmation => "abc123"}
end

def sign_up user
  usr2destroy = User.find_by_email(user[:email])
  usr2destroy.destroy unless usr2destroy.nil?
  visit '/users/sign_up'
  fill_in "Email", :with => user[:email]
  click_button "Signup"
end


When /^I return next time$/ do
  step %{I go to the home page}
end

When /^I sign in with a wrong password$/ do
  step %{I sign in as "bob@cnn.com/xyz321"}
end

When /^I sign in with a correct password$/ do
  step %{I sign in as "bob@cnn.com/abc123"}
end

Given /^I exist as a user$/ do
  # visit reg page
  # enter bob@cnn.com
  # press button
  sign_up valid_user
  # get the conf-token from AR
  @usr = User.find_by_email valid_user[:email]
  @token = @usr.confirmation_token
  # visit conf page
  @cpath = "/users/confirmation?confirmation_token=#{@token}"
  visit @cpath
  # enter the name
  step %{I fill in "Name" with "#{valid_user[:name]}"}
  # enter the password
  step %{I fill in "Password" with "#{valid_user[:password]}"}
  step %{I fill in "Password confirmation" with "#{valid_user[:password]}"}
  # press button
  click_button "Press This"
end

Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  User.new(:name => name,
            :email => email,
            :password => password,
            :password_confirmation => password).save!
end

Then /^I should be already signed in$/ do
  page.html.should match("Logout")
  page.html.should match("Edit registration")
end

Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign up page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I fill in "Password confirmation" with "#{password}"}
  step %{I press "Sign up"}
  step %{I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."}
  step %{I am logout}
end

Given /^I am logout$/ do
  step %{I sign out}
end

Given /^I am not logged in$/ do
  step %{I sign out}
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
end

Then /^I should be signed in$/ do
  step %{I should see "Signed in successfully."}
end

Then /^I should be signed out$/ do
  step %{I should see "Register"}
  step %{I should see "Login"}
  step %{I should not see "Logout"}
end

Then /^I sign out$/ do
  # Cucumber wants to sign_out via GET which I dont like:
  #  visit '/users/sign_out'

  # So I prefer to interact with the home-page:
  visit '/'
  if page.has_link?('Login')
    msg = 'I see Login link, so user should be logged-out.'
    # p msg
  else
    msg =  'I see Logout link, so user should be logged-out.'
    # p msg
    click_link('Logout') if page.has_link?('Logout')
  end
end

When /^I go to the sign in page$/ do
  visit '/users/sign_in'
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I go to the home page$/ do
  visit '/'
end

Given /^I am on the home page$/ do
  visit '/'
end

Given /^I go to the sign up page$/ do
  visit '/users/sign_up'
end

Given /^I fill in the following:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.rows_hash.each do |key, value|
    fill_in(key, :with => value)
  end
end

When /^I press "([^"]*)"$/ do |label|
  click_button label
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I go to the homepage$/ do
  visit '/'
end

When /^I follow "([^"]*)"$/ do |text|
  click_link text
end
