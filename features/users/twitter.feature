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
      When I follow "bob"
      And debug
      And I fill in "twitter name" with "bot4us"
      And I press "Save"
      And I go to the homepage
      And I should see "bot4us"
