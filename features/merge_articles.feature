Feature: Merge Articles
  As a blog administrator
  In order to improve the value of reading blogs
  I want to be able to merge articles with similar content in my blog

  Background:
    Given the blog is set up
    And the following users exist:
      | login | password | email | name | profile_id |
      | bob | bob_pw | bob@bloomer.org | Blog Publisher | 2 |
      | jim | jim_pw | jim@aol.org | Blog Admin | 1 |
    And the following articles exist:
      | title | author | body | published |
      | post one | Bob | Some article text here about dogs | true |
      | post two | Jim | Another article about dogs here   | true |

  Scenario: A non-admin cannot see the option to merge articles
  Given I am logged into the admin panel as "Bob"
  And I visit the the edit page for "post one"
  Then I should not see "Merge Articles"

  Scenario: An admin can see the option to merge articles
  Given I am logged into the admin panel as "Jim"
  And I visit the the edit page for "post two"
  Then I should see "Merge Articles"

  Scenario: Merged article should contain text of both articles
  Given I am logged into the admin panel as "Jim"
  And I visit the the edit page for "post one"
  And I attempt to merge with "post two"
  And I revisit the the edit page for "post one"
  Then I should see "Some article text here about dogsAnother article about dogs here"
