Feature: Confirmation
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up
  and then confirm that I did sign up

    Background:
      Given I am not logged in
      And I am on the home page
      And I go to the sign up page

    @javascriptx
    Scenario: User signs up with valid data
      And I fill in the following:
        | Email                 | user@test.com |
      And I press "Signup"
      And I should see "You have signed up successfully. Go check your e-mail."
      And I_confirm
      And I should see "Password confirmation"
      And I fill in the following:
        | Name                  | Bob Smith |
        | Password              | abc123   |
        | Password confirmation | abc123   |
      And I press "Press This"
      Then I should see "Your account was successfully confirmed. You are now signed in."

