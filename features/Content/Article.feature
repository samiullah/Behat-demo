@article @api @javascript @authenticated
Feature: As an admin I should be able to create,view, edit and delete
         article content type and should have proper
         Validations for all fields

  Background: CREATE Article content
    Given I am logged in as a user with the 'administrator' role
    Then I go to "/en/node/add/article"
    And I wait for page to load
    And I should see "Create Article"
    And I fill in "Title" with "title"
    And I fill in wysiwyg on field "Body" with "body text"
    And I select "Vegetarian " from "Tags" autocomplete
    And I press "Add media"
    And I attach the file "ludo.png" to "Add file"
    And I wait for "2" seconds
    And I fill in "Alternative text" with "imagealttext"
    And I wait for "1" seconds
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I select "Published" from "Save as"
    And I press the "Save" button
    And I should see the success message "Article title has been created."
    And I should see "title"
    And I should see "body text"

   @admin @edit
  Scenario: As an admin I should be able to EDIT  content of type article
    Given I go to "/admin/content"
    And I fill in "title" with "title"
    And I press "Filter"
    And I follow "Edit"
    And I fill in "Title" with "Updated title"
    When I press the "Save" button
    Then I should see the success message "Article Updated title has been updated."

   @admin @delete
  Scenario: As an admin I should be able to DELETE  content of type article
    Given I go to "/admin/content"
    And I fill in "title" with "title"
    And I select "Article" from "Content type"
    And I press "Filter"
    And I check the box "node_bulk_form[0]"
    And I press "Apply to selected items"
    When  I press "Delete"
    Then I should see the success message "Deleted 1 content item."

  Scenario: Check required validations for TITLE field
    Given I go to "/admin/content"
    And I fill in "title" with "title"
    And I press "Filter"
    And I follow "Edit"
    And I fill in "Title" with ""
    And I press the "Save" button
    Then the "#edit-title-0-value" validation Message should be "Please fill in this field."
    And the 'maxlength' attribute for '#edit-title-0-value' field should be '255'

  Scenario: Check attributes, default text format  for BODY field
    Given I go to "/admin/content"
    And I fill in "title" with "title"
    And I press "Filter"
    And I follow "Edit"
    And the 'cols' attribute for '#edit-body-0-value' field should be '60'
    And the 'rows' attribute for '#edit-body-0-value' field should be '9'
    And the 'data-editor-active-text-format' attribute for '#edit-body-0-value' field should be 'basic_html'

#  Scenario Outline: Check TOOLBAR OPTIONS present in BODY field are as expected or not
#    Given I go to "/admin/content"
#    And I fill in "title" with "title"
#    And I press "Filter"
#    And I follow "Edit"
#    And I should see '<option>' in wysiwyg toolbar
#    Examples:
#    |option|
#    |bold|
#    |italic|
#    |drupallink|
#    |drupalunlink|
#    |bulletedlist|
#    |numberedlist|
#    |blockquote  |
#    |drupalmedialibrary|
#    |source            |












