Feature: As Admin I can Manage Badges
  As an admin 
  I want to manage badges 

    Scenario: Add a badge to the system
      Given I signed in and visit create new badge page
      When I create a new badge by entering information
      Then the badge should get created



    Scenario: Update a badge in the system
      Given I signed in and visit edit badge page
      When I update the badge name and save it
      Then the badge name should get updated

    Scenario: Prevent adding duplicate badges to the system
      Given I signed in and visit create new badge page
      When I try to create a new badge by entering information of an existing badge in the system
      Then the system should prevent me from creating a duplicate badge