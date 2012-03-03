Feature: Dan sees Invitation scaffold

    @javascript
    Scenario: Dan sees Invitation scaffold
      Given I visit "/invitations"
      And debug
      Then I should see "Listing invitations"
      And I follow "New Invitation"
      And debug
      Then I should see "Email"

