Feature: Guest can browse projects
  In order to promote Hackternoon
  I allow a guest to browse projects

    @javascript
    Scenario: Guest can browse projects
      Given I sign out
      When I go to the home page
      And I should see "Logged in as: Guest"
      Then I should see page_has_link "Login"
      And I should see page_has_link "Projects"
      And I should see page_has_no_link "New Project"
      And I follow "Projects"
      Then I should see "Github"
      And I should see page_has_no_link "New Project"
      And I exist as a user
      And I go to the home page
      And I should not see "Logged in as: Guest"
      And I should see page_has_link "Projects"
      And I should see page_has_link "New Project"
