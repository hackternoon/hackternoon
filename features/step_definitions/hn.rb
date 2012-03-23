#
# features/step_definitions/hn.rb
#

Then /^I should see page_has_link "([^"]*)"$/ do |link_name|
  # work around emacs-bug here via this dbl-quote: "
  assert(false,"Page is missing link: #{link_name}") unless page.has_link? link_name
end

Then /^I should see page_has_no_link "([^"]*)"$/ do |link_name|
  # work around emacs-bug here via this dbl-quote: "
  assert(false,"Page should not have this link: #{link_name}") if page.has_link? link_name
end

Then /^I should see page_has_selector "([^"]*)"$/ do |sel_name|
  # work around emacs-bug here via this dbl-quote: "
  page.should have_selector(sel_name)
end

Then /^I should see page_has_field "([^"]*)"$/ do |id|
  # work around emacs-bug here via this dbl-quote: "
  page.should have_selector('input#' + id)
end

Then /^I login_as "(.*)\/(.*)"$/ do |email, password|
  step %{I sign out}
  step %{I go to the home page}
  step %{I follow "Register"}
  step %{I fill in "user_email" with "#{email}"}
  step %{I press "Signup"}
  # get the conf-token from AR
  @usr = User.find_by_email email
  @token = @usr.confirmation_token
  # visit conf page
  @cpath = "/users/confirmation?confirmation_token=#{@token}"
  visit @cpath
  # enter the password
  step %{I fill in "user_password" with "#{password}"}
  step %{I fill in "user_password_confirmation" with "#{password}"}
  click_button "Press This"
end

Then /^I visit "([^"]*)"$/ do |path_name|
  # work around emacs-bug here via this dbl-quote: "
  visit path_name
end

Then /^My current_path should be "([^"]*)"$/ do |the_path|
  # work around emacs-bug here via this dbl-quote: "
  current_path.should == the_path
end

Then /^My feature_path should be "([^"]*)"$/ do |a_routes_path|
  # work around emacs-bug here via this dbl-quote: "
  # My call to send() needs parenthesis or else I get a syntax error:
  current_path.should == send(a_routes_path)
end

Then /^I_follow_reset_password_mail_for "([^"]*)"$/ do |email|
  # work around emacs-bug here via this dbl-quote: "
  @usr = User.find_by_email email
  @rptoken = @usr.reset_password_token
  @rpath = "/users/password/edit?reset_password_token=#{@rptoken}"
  visit @rpath
end

Then /^I_create_90_projects$/ do
  # I'm not too picky about who owns the projects.
  # I just want to see many projects so I can test pagination:
  first_id = User.first.id
  (10..99).each{|n| FactoryGirl.create(:project,:name=>"project#{n}",:user_id=>first_id)}
end


Then /^I_should_see_kaminari_links$/ do
  page.should have_selector("nav.pagination")
  page.should have_selector("span.page")
  step %{I should see page_has_link "Next"}
  step %{I should see page_has_link "Last"}
end

