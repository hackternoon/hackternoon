Feature: Warning
  In order to protect user privacy
  As a webmaster
  I want to warn users to hide personal info

    @javascriptx
    Scenario: User sees personal info warning
      Given I sign out
      And I follow "Register"
      And I follow "Warning"
      Then I should see "Warning"

