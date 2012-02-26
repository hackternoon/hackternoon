#
# features/step_definitions/hn.rb
#

Then /^I should see page_has_link "([^"]*)"$/ do |link_name|
  assert(false,"Page is missing link: #{link_name}") unless page.has_link? link_name
end

Then /^I should see page_has_no_link "([^"]*)"$/ do |link_name|
  assert(false,"Page should not have this link: #{link_name}") if page.has_link? link_name
end

Then /^I should see page_has_selector "([^"]*)"$/ do |sel_name|
  page.should have_selector(sel_name)
end

