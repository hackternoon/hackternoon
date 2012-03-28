Feature: Photo
  In order to see people
  As a webmaster
  I want to users to post a profile photo

    @javascript
    Scenario: User posts URL to photo
      Given I sign out
      And I go to the sign up page
      And I fill in "user_email" with "user@test.com"
      And I press "Signup"
      And I should see "You have signed up successfully. Go check your e-mail."
      And I_confirm
      And I should see "Now you can set your password"
      And I fill in the following:
        | user_name                  | Bob Smith |
        | user_password              | abc123   |
        | user_password_confirmation | abc123   |
      And I press "Press This"
      Then I should see "Your account was successfully confirmed. You are now signed in."
      When I follow "user@test.com"
      And I follow "Edit"
      And debug
      And I fill in "user_photo_url" with "http://photos1.meetupstatic.com/photos/member/4/6/0/4/member_437924.jpeg"
      And I press "Save"
      And debug
      And I should see "user@test.com"



