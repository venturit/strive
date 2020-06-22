Feature: Search for User
  As signed in user 
  I want to search for a teammate

    Scenario: User John search for Jane
      Given Jane is a valid user
      When I search for Jane
      Then I should get see her in the search results