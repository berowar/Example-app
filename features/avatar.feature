Feature: Avatar
  In order to use given account
  I want to manage avatars in my profile

  @add_avatar
  Scenario: Add avatar
    Given I am logged in as "dmitry@example.com" with password "pa$$w0rd"
    When I go to path "/profile"
    And I enter attachment details
    Then the avatar added
