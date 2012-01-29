Feature: Guest can browse projects
  In order to promote Hackternoon
  A guest can browse

    @javascript
    Scenario: Guest can browse projects
      Given I sign out
      When I go to the home page
      And I should see "Logged in as: Guest"
      And debug
      Then I should see a link named "Projects"

