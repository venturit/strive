Feature: As Admin I can Manage Strive Categories
  As an admin 
  I want to manage strive categories 

    Scenario: Add a strive category to the system
      Given I signed in and visit create new strive category page
      When I create a new strive category by entering information
      Then the strive category should get created

    Scenario: Update a strive category in the system
      Given I signed in and visit edit strive category page
      When I update the strive category description and save it
      Then the strive category description should get updated
    
    Scenario: Prevent adding duplicate strive categories to the system
      Given I signed in and visit create new strive category page
      When I try to create a new strive category by entering information of an existing strive category in the system
      Then the system should prevent me from creating a duplicate strive category 