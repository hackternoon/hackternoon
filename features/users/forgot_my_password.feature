Feature: Forgot my password
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up
  and then deal with my forgotten password

    @javascript
    Scenario: User deals with forgotten password
      Given I sign out
      And I go to the sign up page
      And I fill in "Email" with "user@test.com"
      And I press "Signup"
      And I should see "You have signed up successfully. Go check your e-mail."
      And I_confirm
      And I should see "Password confirmation"
      And I fill in the following:
        | Name                  | Bob Smith |
        | Password              | abc123   |
        | Password confirmation | abc123   |
      And I press "Press This"
      And I should see "Your account was successfully confirmed. You are now signed in."
      And I sign out
      And I follow "Login"
      And I follow "Forgot your password?"
      And I should see "Forgot your password?"
      And I fill in "user_email" with "user@test.com"
      And I press "Send me reset password instructions"
      Then I should see "You will receive an email "
      And My feature_path should be "root_path"
      And I_follow_reset_password_mail_for "user@test.com"
      Then I should see "Change your password"
      And I fill in "user_password" with "abcxyz"
      And I fill in "user_password_confirmation" with "abcxyz"
      And I press "Change my password"
      Then I should see "Your password was changed successfully."
      And My feature_path should be "root_path"
      And I follow "user@test.com"
      Then I should see "E-Mail: user@test.com"


