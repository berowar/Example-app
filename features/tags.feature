Feature: Tags

  Background:
    Given I am logged in as "dmitry@example.com" with password "pa$$w0rd"


  Scenario: Add tags to existing group
    Given a group exists
    When I go to the group's page
    And follow "Edit Group"
    And fill in "Tags" with "music, group, musical group"
    And press "Update Group"
    Then I should see "music, group, musical group" within "div#tags"