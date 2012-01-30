Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    @javascript
    Scenario: User signs up with valid data then invalid data
      Given I sign out
      And I go to the sign up page
      And I fill in the following:
        | Email                 | user@test.com   |
      When I press "Signup"
      And debug
      Then I should see "You have signed up successfully. Go check your e-mail."
      And I sign out
      And I go to the sign up page
      And I fill in the following:
        | Email                 | invalidemail@junk |
      When I press "Signup"
      And debug
      Then I should see "Email is invalid"
