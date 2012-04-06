Feature: A project pitcher can pitch an owner for permission to work on project

    @javascript
    Scenario: Pat pitches Dan to work on Hackternoon.com
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
      And I follow "Logout"
      And I login_as "pat@hackternoon.com/abc123"
      And I follow "Projects"
      And I follow "Hackternoon.com"
      And I fill in "pitch_msg" with "I know web tech, databases, and cloud computing"
      And debug
      And I press "Send Pitch"
      And I follow "Projects"
      And I follow "Hackternoon.com"
      And I should see "Pitches to work on this project have been sent"
