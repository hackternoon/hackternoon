Feature: Guest can browse projects
  In order to promote Hackternoon
  I allow a guest to see my html layout

    @javascript
    Scenario: Guest can browse projects
      Given I sign out
      When I go to the home page
      And I should see "Logged in as: Guest"
      Then I should see page_has_link "Login"
      And I should see page_has_link "Projects"
      And I should see page_has_link "Hackternoon"
      And I should see "Hackternoon 2012"
      And debug
      And I should see page_has_no_link "New Project"

