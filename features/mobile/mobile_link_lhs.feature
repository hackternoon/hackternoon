Feature: A user should see a mobile link on the LHS

    @javascript
    Scenario: A user should see a mobile link on the LHS
      Given I go to the home page
      And I follow "Mobile"
      Then I should see "Under Construction"
