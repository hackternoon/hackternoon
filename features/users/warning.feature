Feature: Warning
  In order to protect user privacy
  As a webmaster
  I want to warn users to hide personal info

    @javascript
    Scenario: User sees personal info warning
      Given I sign out
      And I follow "Register"
      And I follow "Warning"
      And I should see "mail.yahoo.com"
      And I press "close_warning"
      Then I should see page_has_link "Warning"
