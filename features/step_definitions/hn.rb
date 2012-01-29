#
# features/step_definitions/hn.rb
#

Then /^I should see page_has_link "([^"]*)"$/ do |link_name|
debugger
  assert false unless page.has_link? link_name
end
