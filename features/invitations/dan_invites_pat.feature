Feature: A project owner can invite others to work on the project

    @javascript
    Scenario: Dan invites Pat to work on Hackternoon.com
      Given I login_as "dan@hackternoon.com/abc123"
      And I go to the home page
      And I follow "Projects"
      And I follow "New Project"
      And I fill in the following:
        | Name               | Hackternoon.com   |
        | project_dscrptn    | Hackternoon.com helps Hackternooners find partners and projects. |
        | project_github_url | http://github.com/hackternoon |
      And I press "Save"
      Then I should see "Project was successfully created."
      And I should not see "Invitations have been sent to these e-mail addresses"
      And I should see page_has_field "rcvr_email"
      And I should see "Invite someone to help you with the project"
      And I fill in "rcvr_email" with "pat@cnn.com"
      And I press "Send Invitation"
      Then I should see "Invitation sent to: pat@cnn.com"
      And I should see "and copy sent to: dan@hackternoon.com"
      And I should see "Invitations to work on this project have been sent to these e-mail addresses"
      And I should see page_has_link "pat@cnn.com"
      When I follow "pat@cnn.com"
      And debug
      Then I should see "This user has been invited to these projects"
      And I should see page_has_link "Hackternoon.com"
      And  I follow "Hackternoon.com"
      And debug
      Then I should see "Hackternoon.com helps Hackternooners find partners and projects"
