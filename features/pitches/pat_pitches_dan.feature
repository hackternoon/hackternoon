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
      And I should see "This project looks interesting"
      And I fill in "pitch_msg" with "I know web tech, databases, and cloud computing"
      And I press "Send Pitch"
      And I should see "Pitch sent to: dan@hackternoon.com, and copy sent to:"
      And I should see "Pitches to work on this project have been sent"
      And I follow "Projects"
      And I follow "Hackternoon.com"
      And I should see "Pitches to work on this project have been sent from these e-mail addresses"
      And I follow "pat@hackternoon.com"
      And I should see "pat@hackternoon.com"