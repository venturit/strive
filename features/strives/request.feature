Feature: As a teammate I can request a strive for a fellow teammate
  As a teammate of Venturit X project 
  I want to request a silver strive badge for Joe Cocker for going above and beyond to help with docker deployment

    Scenario: Request a silver strive badge from supervisor for Joe
      Given I signed in and visit request a strive page
      When I create a request entering request information
      Then the request should get created without errors
