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
        | project_github_url | http://github.com/hackternoon/hackternoon |
      And I press "Save"
      Then I should see "Project was successfully created."
      And I follow "New Project"
      And I fill in the following:
        | Name               | Hackternoon School   |
        | project_dscrptn    | Hackternoon School Hackternooners learn Tech.|
        | project_github_url | http://github.com/hackternoon/school |
      And I press "Save"
      Then I should see "Project was successfully created."
      And I follow "New Project"
      And I fill in the following:
        | Name               | Hackternoon Advertising   |
        | project_dscrptn    | Hackternoon Advertising Portal |
        | project_github_url | http://github.com/hackternoon/advertising |
      And I press "Save"
      Then I should see "Project was successfully created."
      And I follow "Logout"
      And I login_as "pat@hackternoon.com/abc123"
      And I follow "Projects"
      And I follow "Hackternoon.com"
      And I should see "This project looks interesting"
      And I should see "You have 30 pitches left" 
      And I fill in "pitch_msg" with "I know web tech, databases, and cloud computing"
      And I press "Send Pitch"
      And I should see "Pitch sent to: dan@hackternoon.com, and copy sent to:"
      And I should see "Pitches to work on this project have been sent"
      And I follow "Projects"
      And I follow "Hackternoon School"
      And I should see "You have 29 pitches left" 
      And I fill in "pitch_msg" with "I want to develop school content"
      And I press "Send Pitch"
      And I should see "Pitch sent to: dan@hackternoon.com, and copy sent to:"
      And I should see "Pitches to work on this project have been sent"
      And I follow "Projects"
      And I follow "Hackternoon.com"
      And I follow "pat@hackternoon.com"
      And I should see "This user has pitched to these projects:"
      And I should see "Hackternoon.com"
      And I should see "Hackternoon School"
      And I should not see "Hackternoon Advertising"



