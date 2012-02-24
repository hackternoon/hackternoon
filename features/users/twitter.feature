Feature: Twitter
  As a registered user of the website
  I want to edit my user profile
  so I can add my twitter id

    @javascript
    Scenario: I sign in and edit my account
      Given I exist as a user
      And I sign out
      And I sign in with a correct password
      Then I should see "Signed in successfully."
      When I follow "bob@cnn.com"
      And I fill in "Twitter handle" with "@bot4us"
      And I press "Save"
      And I should see "Current password can't be blank"
      And I fill in "Current password" with "abc123"
      And I press "Save"
      Then I should see "You updated your account successfully"
      And debug
      And I follow "bob@cnn.com"
      And debug
      And I go to the homepage
      And I should see "Hackternoon"
