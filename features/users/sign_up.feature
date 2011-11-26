Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I am not logged in
      And I am on the home page
      And I go to the sign up page

    @javascript
    Scenario: User signs up with valid data
      And I fill in the following:
        | Email                 | user@test.com   |
      And I press "Signup"
      And debug
      Then I should see "You have signed up successfully. Go check your e-mail."
      
