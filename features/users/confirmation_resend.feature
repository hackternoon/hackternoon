Feature: Confirmation Resend
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up
  and then confirm that I did sign up

    @javascript
    Scenario: User asks for 2nd confirmation token
      Given I sign out
      And I follow "Register"
      And I fill in "Email" with "user@test.com"
      And I press "Signup"
      And I should see "You have signed up successfully. Go check your e-mail."
      And I follow "Register"
      And I should see "Didn't receive confirmation instructions?"
      And I follow "Didn't receive confirmation instructions?"
      And I should see "Did not receive confirmation instructions?"
      And I fill in "Email" with "user@test.com"
      And I press "Resend confirmation"
      Then I should see "If your e-mail exists on our database"
      And My feature_path should be "root_path"







