Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I am not logged in
      And I am on the home page
      And I go to the sign up page

    @javascriptx
    Scenario: User signs up with invalid email
      And I fill in the following:
        | Email                 | invalidemail@junk |
      And debug
      And I press "Signup"
      Then I should see "Email is invalid"

    Scenario: User signs up with valid data
      And I fill in the following:
        | Email                 | user@test.com   |
      And I press "Signup"
      Then I should see "You have signed up successfully. Go check your e-mail."
