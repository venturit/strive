Feature: Invite User
  As an admin 
  I want to invite a user to strive
  Invited user should be able to sign in

    Scenario: Admin Invite User
      Given I am an admin
      Given I signed in with valid admin credentials
      Given I visit new user page
      When I create a new user by entering user information
      Then the user should get an invite email
    #   When I return to the site
    #   Then I should be signed out

    Scenario: Unauathorized tries to Invite User
      Given I am a user
      Given I signed in with valid credentials
      Given I try to visit new user page
      Then I should get an unauthorized error
      When I try to create a new user by entering user information
      Then I should get a field not found error