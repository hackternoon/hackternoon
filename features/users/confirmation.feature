Feature: Confirmation
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up
  and then confirm that I did sign up

    @javascript
    Scenario: User confirms sign up
      Given I sign out
      And I go to the sign up page
      And I fill in "user_email" with "user@test.com"
      And I press "Signup"
      And I should see "You have signed up successfully. Go check your e-mail."
      And I_confirm
      And I should see "Now you can set your password"
      And I fill in the following:
        | user_name                  | Bob Smith |
        | user_password              | abc123   |
        | user_password_confirmation | abc123   |
      And I press "Press This"
      Then I should see "Your account was successfully confirmed. You are now signed in."

