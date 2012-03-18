Feature: Change Password
  As a registered user of the website
  I want to change my password

    @javascript
    Scenario: I sign in and change my password
      Given I exist as a user
      And I sign out
      And I sign in with a correct password
      Then I should see "Signed in successfully."
      When I follow "bob@cnn.com"
      And I follow "Edit"
      And I fill in "user_password" with "abcxyz"
      And I fill in "user_password_confirmation" with "abcxyz"
      And I_fill_in_current_password
      And I press "Save"
      And I go to the homepage
      And I should see "Logged in as: bob@cnn.com"
      When I follow "Logout"
      And I follow "Login"
      And I fill in "user_email" with "bob@cnn.com"
      And I fill in "user_password" with "abcxyz"
      And I press "Sign in"
      Then I should see "Signed in successfully."
      And My feature_path should be "root_path"


