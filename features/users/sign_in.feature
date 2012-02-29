Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    @javascript
    Scenario: User signs in successfully and unsuccessfully
      Given I exist as a user
      And I sign out
      And I sign in with a correct password
      Then I should see "Signed in successfully."
      And I return next time
      Then I should be already signed in
      And I sign out
      And I sign in with a wrong password
      Then I should see "Invalid email or password."
      Then I should be signed out
      And no user exists with an email of "user2@test.com"
      And I go to the sign in page
      And I sign in as "user2@test.com/please"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out
