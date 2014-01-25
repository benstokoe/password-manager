Feature: As a customer I want to be able to see my passwords in one place

  Scenario: Customer should be able to see a list of their passwords
    Given I am on the 'home' page
    Then I should see:
      | Amazon | password |
      | eBay   | password |
      | PayPal | password |

  Scenario Outline: Customer should be able to add a password
    Given I am on the 'home' page
    When I click 'Add Password' button
    And I fill in the add password information <name> <password>
    And I click 'Add' button
    Then I should see:
      | Facebook | password |

  Examples:
    | name     | password |
    | Facebook | password |

  # Scenario Outline: Customer should be able to edit a password
  #   Given I am on the 'home' page
  #   When I click 'edit_facebook' button
  #   And I fill in the edit password information <password>
  #   And I click 'Edit' button
  #   Then I should see:
  #     | thisismynewpassword |

  # Examples:
  #   | password            |
  #   | thisismynewpassword |

  Scenario: Customer should be able to delete a password
    Given I am on the 'home' page
    When I click 'delete_facebook' button
    Then I should not be able to see 'Facebook'
