Feature: A project owner can invite others to work on the project

    @javascript
    Scenario: Dan invites Pat to work on Hackternoon.com
      Given I login_as "dan@hackternoon.com/abc123"
      And I go to the home page
      And I follow "Projects"
      And I follow "New Project"
      And I fill in the following:
        | Name               | hackternoon.com   |
        | project_dscrptn    | Hackternoon.com helps Hackternooners find partners and projects. |
        | project_github_url | http://github.com/hackternoon |
      And I press "Save"
      Then I should see "Project was successfully created."
      And I should see page_has_field "invitation_email"
      And I should see "Invite someone to help you with the project"
      And I fill in "invitation_email" with "pat@cnn.com"
      And debug
      And I press "Send Invitation"
      And debug
      Then I should see "Invitation sent to: pat@cnn.com"
      And I should see "and copy sent to: dan@hackternoon.com"
