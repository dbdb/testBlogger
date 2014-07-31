Feature: Edit Layout
  In order to customize my blog
  As a hipster
  I want to edit layout

  Background:
    Given I am logged in
    And I am on the Edit Layout page

  Scenario: Edit Header
    When I edit blog header
    And I go to my blog page
    Then blog header should be updated

  @reset_layout
  Scenario: Drag and drop widget
    When I drag and drop "Blog Archive" widget to "Blog Posts" widget
    Then Main section of layout should include text "Blog Archive"