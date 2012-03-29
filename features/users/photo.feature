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
      And I should see page_has_selector "img[@src='http://0.gravatar.com/avatar/fa3c0e79ecfe1f9e2cdc906ae34b14ee']"
      And I follow "Edit"
      And I fill in "photo_url" with "http://photos1.meetupstatic.com/photos/member/4/6/0/4/member_437924.jpeg"
      And I fill in "user_current_password" with "abc123"
      And I press "Save"
      And I follow "user@test.com"
      And I should see page_has_selector "img[@src='http://photos1.meetupstatic.com/photos/member/4/6/0/4/member_437924.jpeg']"
      And I follow "Edit"
      And I fill in "photo_url" with "http://photos1.meetupstatic.com/photos/member/4/6/0/4/member_437924.jpeg"
      And I fill in "user_current_password" with "abc123"
      And I press "Save"
      And I follow "user@test.com"
      And I should see page_has_selector "img[@src='http://photos1.meetupstatic.com/photos/member/4/6/0/4/member_437924.jpeg']"
      And I follow "Edit"
      And I fill in "photo_url" with "http://photos3.meetupstatic.com/photos/member/4/b/1/5/member_18139221.jpeg"
      And I fill in "user_current_password" with "abc123"
      And I press "Save"
      And I follow "user@test.com"
      And I should see page_has_selector "img[@src='http://photos3.meetupstatic.com/photos/member/4/b/1/5/member_18139221.jpeg']"
      And I follow "user@test.com"






