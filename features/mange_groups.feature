Feature: Manage Groups
  In order to use given account
  I want to manage groups

  Background:
    Given I am logged in as "dmitry@example.com" with password "pa$$w0rd"


  Scenario: Add a new group
    Given I go to path "/groups"
    When follow "New Group"
    And fill in "Title" with "My new Group"
    And press "Create Group"
    Then I should see "My new Group" within "h2"

  Scenario: Add a new group with tags
    Given I go to path "/groups"
    When follow "New Group"
    And fill in "Title" with "My new Group with Tags"
    And fill in "Tags" with "group, my group"
    And press "Create Group"
    Then I should see "My new Group with Tags" within "h2"
    And should see "group, my group" within "div#tags"

  Scenario: Edit group
    Given a group exists with title: "Music"
    And I go to the group's page
    When I follow "Edit Group"
    And fill in "Title" with "Rock Music"
    And press "Update Group"
    Then I should see "Rock Music" within "h2"

  Scenario: Join to the group
    Given a group exists
    When I go to the group's page
    Then I should see button "Join group"

    When I press "Join group"
    Then I should see "You successful joined to Group"
    And should see "dmitry@example.com" within "div#members"