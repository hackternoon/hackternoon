Feature: Bob can page through many projects
  In order to promote Hackternoon
  I allow Bob, a current user, to page through many projects

    @javascriptx
    Scenario: Bob can page through many projects
      Given I exist as a user
      And I go to the home page
      And I should see page_has_link "Projects"
      And I_create_90_projects
      And I follow "Projects"
      And I should see "Projects"
      And I should see page_has_link "Move Projects Left"
      And I follow "Move Projects Left"
      And I should see page_has_link "Move Projects Right"
      And I follow "Move Projects Right"
      And I should see "Logged in as"
      And I should see page_has_link "Move Projects Left"
      And I_should_see_kaminari_links


