Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

    @javascript
    Scenario: I sign in and edit my account
      Given I exist as a user
      And I am not logged in
      And I sign in with a correct password
      Then I should see "Signed in successfully."
      And debug
      When I follow "Edit registration"
      And I fill in "Name" with "baz"
      And I fill in "Current password" with "please"
      And I press "Update"
      And I go to the homepage
      Then I should see "User: baz"
