@content-moderation @api @javascript
Feature: Basic Page default Content moderation permissions set on /admin/people/permissions should be correct

  @admin @author
  Scenario Outline:  Only admin and author role should be able to create, edit, delete BASIC PAGE content in Draft Status
    Given I am logged in as a user with the '<role>' role
    Then I should see "Log out"
    And I go to "node/add/page"
    And I should see "Create Basic page"
    And I fill in "Title" with "<title>"
    And I fill in wysiwyg on field "edit-body-0-value" with "<body>"
    And I select "Draft" from "Save as"
    And I press the "Save" button
    And I should see the success message "Basic page <title> has been created."
    #Check for Edit operation
    And I should see "Edit"
    And I follow "Edit"
    And I fill in "Title" with "Updated <title>"
    And I press the "Save" button
    And I should see the success message "Basic page Updated <title> has been updated"
    And I wait for "10" seconds
    #check for Delete operation
    And I should see "Delete"
    And I follow "Delete"
    And I should see "This action cannot be undone."
    And I press "Delete"
    And I wait for page to load
    And I should see the success message "The Basic page Updated <title> has been deleted."

    Examples:
      | role          | title                  | body                    |
      | Administrator | Basic Page admin Test  | Lorum Ipsum Body Admin  |
      | Author        | Basic Page Author Test | Lorum Ipsum Body Author |

 @authenticated @editor
  Scenario Outline: Authenticated and Editor role users should not be able to create BASIC Page content
    Given I am logged in as a user with the '<role>' role
    Then I should see "Log out"
    And I go to "node/add/page"
    And I should not see "Create Basic page"
    And I should see "Access denied"

    Examples:
      | role          |
      | Authenticated |
      | Editor        |

   @anonymous
  Scenario: As an anonymous user I should not have  access to create basic page
    Given I am on "/"
    Then I should see "Log in"
    And I go to "node/add/page"
    And I should see "Access denied"

 @admin
  Scenario: As an admin, I should have permissions to Create, Delete, edit, Revert/Delete revisions and Translate basic
            page content
    # Create Basic page in Draft state
    Given I am logged in as a user with the 'administrator' role
    Then I go to "node/add/page"
    And I fill in "Title" with "my title"
    And I fill in wysiwyg on field "edit-body-0-value" with "body"
    And I select "Draft" from "Save as"
    And I press the "Save" button
    And I should see the success message "Basic page my title has been created."
    # Move to published state
    And I should see "Change to"
    When I press "Apply"
    Then I should see "The moderation state has been updated."
    # Edit the published node
    And I should see "Edit"
    When I follow "Edit"
    And I fill in "Title" with "Updated text"
    And I press the "Save" button
    Then I should see the success message "Basic page Updated text has been updated"
    # Revert to older revision
    When I follow "Revisions"
    And I revert to oldest revision
    And I should see "Are you sure you want to revert to the revision from"
    And I press "Revert"
    Then I should see "Basic page my title has been reverted to the revision from"
    And I wait for "5" seconds
    # Translate the node
    When I follow "Translate"
    And I wait for "5" seconds
    And I follow "Add"
    And I fill in "Título" with "Spanish title text"
    And I press "Guardar (esta traducción)"
    Then I should see "Página básica Spanish title text ha sido actualizado."
    And I wait for "5" seconds
    # Delete the node
    When I follow "Eliminar"
    And I press "Borrar la traduccion Español"
    Then I should see "La traducción de Español de Spanish title text de Página básica ha sido eliminada."

  @author
  Scenario: As an Author I should be able to Create new content, Delete Own Content, View Revisions, Delete
            Revisions and I should not be able to Delete other Content and Revert Revisions. Also Should not be
            able to Translate/Publish content

      # Create Basic page in draft state
    Given I am logged in as a user with the 'Author' role
    Then I should see "Log out"
    And I go to "node/add/page"
    And I should see "Create Basic page"
    And I fill in "Title" with "Author Title"
    And I fill in wysiwyg on field "edit-body-0-value" with "Author Body"
    And I select "Draft" from "Save as"
    And I press the "Save" button
    And I should see the success message "Basic page Author Title has been created."
       # Assert if Translate option is not present
    And I should not see "Translate"
      # Assert if Published status is not present for author role
    When I follow "Edit"
    Then select "moderation_state[0][state]" should not have an option "Published"
    And I press the "Save" button
      # Assert if Revision Revert option is not present
    When I follow "Revisions"
    Then I should not see "Revert" in the "content" region
      # Assert if Revision Delete option is present
    When I follow "Delete"
    And I press the "Delete" button
    Then I should see "has been deleted"


  @data_create @editor
  Scenario: As an Editor I should
            Not have access to create Basic Page
            Should be able to Edit and Publish Existing Basic Page
            Should have access to Delete any content
            Should be able to Delete Revisions
            Should be able to Revert Revisions

    # Check if Editor has no access to basic page node creation page
    Given I am logged in as a user with the 'Editor' role
    When I go to "node/add/page"
    Then I should see "Access denied"
    # Verify if Editor has permission to publish any  existing basic page content
    When I go to "admin/content"
    And I should see "Welcome Test page"
    And I follow "Welcome Test page"
    And  I press "Apply"
    Then I should see "The moderation state has been updated."
    # Verify if Editor has permission to edit any  existing basic page content
    And I should see "Edit"
    When I follow "Edit"
    And I fill in "Title" with "Updated test"
    And I press the "Save" button
    Then I should see the success message "Basic page Updated test has been updated"
    # Verify if Editor has permission to Revert to older revision
    When I follow "Revisions"
    And I revert to oldest revision
    And I should see "Are you sure you want to revert to the revision from"
    And I press "Revert"
    Then I should see "has been reverted to the revision from"
    And I wait for "2" seconds
    # Verify if Editor has permission to Delete any  revision
    When I delete oldest revision
    And I press "Delete"
    Then I should see "has been deleted."
    And I wait for "2" seconds
    # Verify if Editor has permission to Delete content
    When I go to "admin/content"
    And I follow "Welcome Test page"
    And I follow "Delete"
    And I should see "Are you sure you want to delete the content item"
    And I press "Delete"
    Then I should see "has been deleted."












































































