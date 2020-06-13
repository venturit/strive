Feature: Hello Strive
  As a product manager
  I want only invited users to access the protected pages
  So that everyone should log in 

  Scenario: User sees the log in screen if not signed in already  
    When I go to the homepage
    Then I should see the welcome message