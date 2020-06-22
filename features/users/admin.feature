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
      Given I try to visit admin new user page
      Then I should get an unauthorized error



# Feature: Manage Badges
#   As an admin 
#   I want to manage strives 

#     Scenario: Add a badge to the system
#       Given I visit create new badge page
#       When I create a new badge by entering information
#       Then the badge should get created
