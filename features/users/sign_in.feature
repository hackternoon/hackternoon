Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    @javascript
    Scenario: User enters wrong password
      Given I exist as a user
      And I am not logged in
      And debug
      When I sign in with a wrong password
      Then I see an invalid login message
      And I should be signed out

    Scenario: User is not signed up
      Given I am not logged in
      And no user exists with an email of "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out
