Feature: Articles

  Background:
    Given I am logged in as "dmitry@example.com" with password "pa$$w0rd"


  Scenario: Add article to existing group
    Given a group exists
    When I go to the group's page
    And follow "new article"
    And fill in "Title" with "My first Article in this Group"
    And fill in "Body" with "Lorem ipsum dolor sit amet, consectetur adipisicing elit ..."
    And press "Create Article"
    Then I should see "My first Article in this Group" within "h1"
    And should see "Lorem ipsum dolor sit amet, consectetur adipisicing elit ..."