Feature: Comments

  Background:
    Given I am logged in as "dmitry@example.com" with password "pa$$w0rd"

  @javascript
  Scenario: Add comment to existing article
    Given a group exists
    And a article exists with group: the group
    When I go to the group's article's page
    And fill in "Your comment" with "My first Comment"
    And press "Create Comment"
    Then I should see "My first Comment" within "div.comment"