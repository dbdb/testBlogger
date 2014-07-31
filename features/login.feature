Feature: Login
  In order to post cats
  As a blogger
  I want to login
  
  Background:
    Given I am on the Login page
    
  Scenario: Successful admin login
    When I login as a blog admin
    Then Home page should be opened
    