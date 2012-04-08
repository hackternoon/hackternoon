Feature: Guest can browse projects
  In order to promote Hackternoon
  I allow a guest to browse projects

    @javascript
    Scenario: Guest can browse projects
      Given I sign out
      When I go to the home page
      And I should see "Logged in as: Guest"
      Then I should see page_has_link "Login"
      And I should see page_has_link "Projects"
      And I should see page_has_no_link "New Project"
      And I follow "Projects"
      Then I should see "Github"
      And I should see page_has_no_link "New Project"
      And I exist as a user
      And I go to the home page
      And I should see "bob@cnn.com"
      And I should not see "Logged in as: Guest"
      And I should see page_has_link "Projects"
      And I should see page_has_link "New Project"
      And I follow "New Project"
      And I should see "New Project"
      And I fill in the following:
        | project_name       | BobArtGallery4.us |
        | project_dscrptn    | Name says it all! |
        | project_github_url | http://githup.com/BobSmith99/BobArtGallery4us |
        | project_tech_tag1  | Ruby on Rails     |
        | project_biz_tag1   | Art Gallery       |
      And I press "Save"
      And I should see "Project was successfully created."
      And I follow "Projects"
      And I should see "BobArtGallery4.us"
      And I follow "BobArtGallery4.us"
      And I should see "BobArtGallery4us"
      And I follow "Logout"
      And I should see "Logged in as: Guest"
      And I follow "Projects"
      And I should see "BobArtGallery4.us"
      And I follow "BobArtGallery4.us"
      And I should see "BobArtGallery4us"

