Feature: Edit User
  As a registered user of the website
  I want to edit my user profile
  so I can change my username

    @javascript
    Scenario: I sign in and edit my account
      Given I exist as a user
      And I sign out
      And I sign in with a correct password
      Then I should see "Signed in successfully."
      When I follow "bob@cnn.com"
      And I follow "Edit"
      And I fill in "Name" with "Bob Smith"
      And I fill in "Twitter handle" with "@bobcnncom"
      And I fill in "Location" with "New York City"
      And I_fill_in_current_password
      And I press "Save"
      And I go to the homepage
      And I should see "Logged in as: bob@cnn.com"
      When I follow "bob@cnn.com"
      Then I should see "Bob Smith"
      And I should see "@bobcnncom"
      And I should see "New York City"
