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
      When I follow "bob"
      And I fill in "Name" with "baz"
      And I_fill_in_current_password
      And debug
      And I press "Save"
      And debug
      And I go to the homepage
      And debug
      And I should see "Logged in as: bob@cnn.com"