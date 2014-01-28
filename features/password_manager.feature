Feature: As a customer I want to be able to see my passwords in one place

  Scenario Outline: Customer should be able to add a password
    Given 'Facebook' does not already exist
    And I am on the 'home' page
    When I click 'Add Password' button
    And I fill in the add password information <name> <password>
    And I click 'Add' button
    Then I should see:
      | Facebook | password |
  Examples:
    | name     | password |
    | Facebook | password |

  # @wip
  # Scenario Outline: Customer will see the new password highlighted and on screen
  #   Given I am on the 'home' page
  #   When I click 'Add Password' button
  #   And I fill in the add password information <name> <password>
  #   And I click 'Add' button
  #   Then I should see the <name> row highlighted  
  #   Examples:
  #   | name | password |
  #   | eBay | password |

  Scenario Outline: User should not be able to add site that already exists
    Given 'Facebook' already exists
    And I am on the 'home' page
    When I click 'Add Password' button
    And I fill in the add password information <name> <password>
    And I click 'Add' button
    Then I should see an error message 'This site already exists'
  Examples:
    | name     | password |
    | Facebook | password |

  Scenario Outline: Customer should be able to edit a password
    Given 'Facebook' already exists
    And I am on the 'home' page
    When I click 'edit_facebook' button
    And I fill in the edit password information <password>
    And I click 'Edit' button
    Then I should see:
      | thisismynewpassword |
  Examples:
    | password            |
    | thisismynewpassword |

  Scenario: Customer should be able to delete a passwords
    Given 'Facebook' already exists
    And I am on the 'home' page
    When I click 'delete_facebook' button
    Then I should not be able to see 'Facebook'
