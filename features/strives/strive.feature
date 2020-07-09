Feature: As a requestee, Charles Wood, I want to award a strive for the request
  As a requestee of a request 
  I want to award the strive requested

    Scenario: Requestee can award a strive from the request 
      Given I, Charles, signed in and visit requests page
      When I click award strive
      Then the strive should get awarded

    Scenario: Requestee cannot award a strive from the same request 
      Given I, Charles, signed in and visit requests page
      When I click award strive to request that have already awarded 
      Then the strive should not get awarded

    Scenario: System should block Charles awarding a dubplicate strive during the same award period.
      Given I, Charles, has already awarded a strive for Jane under Reliable category
      Given I, visit Jane's page
      When I click award strive and award strive under Reliable category
      Then the system block the strive creation