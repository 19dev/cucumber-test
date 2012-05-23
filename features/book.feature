Feature: User manages books
  Scenario: User adds a new book
    Given I go to the new book page
    And I fill in "Name" with "WarPeace"
    When I press "Create" 
    Then I should be on the book list page
    And I should see "WarPeace"
