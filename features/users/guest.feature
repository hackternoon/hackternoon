Feature: Sign in
  In order to get access to unprotected sections of the site
  A user can be a guest

    @javascript
    Scenario: User is a guest
      Given I sign out
      When I go to the home page
      Then I should see "Logged in as: Guest"
