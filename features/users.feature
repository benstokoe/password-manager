Feature: As a user I want to have a login system so my passwords are secure and allow for multiple users

  Scenario: Add user to system
    Given I am on the 'Log In' page
    When I click 'Add User' button
    And I fill in the new user information
    And I click 'Add' button
    Then I should see 'User's name'

  Scenario: To log in to the system correctly
    Given I am on the 'Log In' page

  Scenario: Enter wrong details

  Scenario: Sign in with one user when there are two users

  Scenario: Log out