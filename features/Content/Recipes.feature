@recipe @javascript @api  @admin
Feature: As an admin create I should be able to create recipe content type
          and I should be able to see it in recipe listings page

 @published
  Scenario Outline: Login as admin and create recipe node and assert recipe data in listing page in published mode
                    as anonymous user
    Given I login with username "admin" and password "admin"
    When I am viewing a "recipe_category" term with the name "<recipe_category>"
    And I am viewing a "tags" term with the name "kashmiri sweets"
    And I am on the homepage
    And I should see "Log out"
    And I wait for page to load
    And I go to "/en/node/add/recipe"
    And I should see "Create Recipe"
    And I fill in "Recipe Name" with "<recipe_name>"
    And I fill in "Preparation time" with "<preparation_time>"
    And I fill in "Cooking time" with "<cooking_time>"
    And I fill in "Number of servings" with "<number_of_servings>"
    And I select "<difficulty>" from "field_difficulty"
    And I wait for "2" seconds
    And I press "Add media"
    And I attach the file "ludo.png" to "Add file"
    And I wait for "2" seconds
    And I fill in "Alternative text" with "imagealttext"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I select "kashmiri sweets" from "Tags" autocomplete
    And I select "kashmiri" from "Recipe category" autocomplete
    And I fill in wysiwyg on field "edit-field-summary-0-value" with "ededede"
    And I fill in "field_ingredients[0][value]" with "<ingredient>"
    And I fill in wysiwyg on field "edit-field-recipe-instruction-0-value" with "boil for 2 mins"
    And I select "Published" from "Save as"
    And I press the "Save" button
    And I print the current url
    And I logout
    # Assert recipe created after publishing as anonymous user
    And I go to "/en/recipes"
    And I should see "Recipes"
    And I should see "<recipe_name>"
    And I should see "<difficulty>"
    Examples:
      |recipe_name|preparation_time|cooking_time|number_of_servings|difficulty|recipe_category|ingredient|
      | Gulab jamun|60             |45          |4                 |Easy      |kashmiri       |Besan     |

   @draft
  Scenario Outline: Login as admin and create recipe node in draft status and assert that it does not reflect on
                    Recipe listing page
    Given I login with username "admin" and password "admin"
    When I am viewing a "recipe_category" term with the name "<recipe_category>"
    And I am viewing a "tags" term with the name "kashmiri sweets"
    And I am on the homepage
    And I should see "Log out"
    And I wait for page to load
    And I go to "/en/node/add/recipe"
    And I should see "Create Recipe"
    And I fill in "Recipe Name" with "<recipe_name>"
    And I fill in "Preparation time" with "<preparation_time>"
    And I fill in "Cooking time" with "<cooking_time>"
    And I fill in "Number of servings" with "<number_of_servings>"
    And I select "<difficulty>" from "field_difficulty"
    And I wait for "2" seconds
    And I press "Add media"
    And I attach the file "ludo.png" to "Add file"
    And I wait for "2" seconds
    And I fill in "Alternative text" with "imagealttext"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I select "kashmiri sweets" from "Tags" autocomplete
    And I select "kashmiri" from "Recipe category" autocomplete
    And I fill in wysiwyg on field "edit-field-summary-0-value" with "ededede"
    And I fill in "field_ingredients[0][value]" with "<ingredient>"
    And I fill in wysiwyg on field "edit-field-recipe-instruction-0-value" with "boil for 2 mins"
    And I select "Draft" from "Save as"
    And I press the "Save" button
    # Assert recipe created should not be reflected on Listing page
    And I go to "/en/recipes"
    And I should see "Recipes"
    And I should not see "<recipe_name>"


    Examples:
      |recipe_name|preparation_time|cooking_time|number_of_servings|difficulty|recipe_category|ingredient|
      | Gulab jamun draft|60             |45          |4                 |Medium      |kashmiri       |Besan     |

   @archived
  Scenario Outline: Login as admin and create recipe node and make status as archived,
                    should not reflect on Recipe listing page
    Given I login with username "admin" and password "admin"
    When I am viewing a "recipe_category" term with the name "<recipe_category>"
    And I am viewing a "tags" term with the name "kashmiri sweets"
    And I am on the homepage
    And I should see "Log out"
    And I wait for page to load
    And I go to "/en/node/add/recipe"
    And I should see "Create Recipe"
    And I fill in "Recipe Name" with "<recipe_name>"
    And I fill in "Preparation time" with "<preparation_time>"
    And I fill in "Cooking time" with "<cooking_time>"
    And I fill in "Number of servings" with "<number_of_servings>"
    And I select "<difficulty>" from "field_difficulty"
    And I wait for "2" seconds
    And I press "Add media"
    And I attach the file "ludo.png" to "Add file"
    And I wait for "2" seconds
    And I fill in "Alternative text" with "imagealttext"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I select "kashmiri sweets" from "Tags" autocomplete
    And I select "kashmiri" from "Recipe category" autocomplete
    And I fill in wysiwyg on field "edit-field-summary-0-value" with "ededede"
    And I fill in "field_ingredients[0][value]" with "<ingredient>"
    And I fill in wysiwyg on field "edit-field-recipe-instruction-0-value" with "boil for 2 mins"
    And I select "Published" from "Save as"
    And I press the "Save" button
    And I follow "Edit"
    And I select "Archived" from "Change to"
    And I press the "Save" button
    # Assert recipe created after moving to archived state should not reflect in recipe listing page
    And I go to "/en/recipes"
    And I should see "Recipes"
    And I should not see "<recipe_name>"
    Examples:
      |recipe_name|preparation_time|cooking_time|number_of_servings|difficulty|recipe_category|ingredient|
      | Gulab jamun Archived|60             |45          |4                 |Easy      |kashmiri       |Besan     |


  Scenario: Verify mandatory field validation message  for recipe title field
    Given I login with username "admin" and password "admin"
    And I go to "/en/node/add/recipe"
    And I press "Save"
    Then the "#edit-title-0-value" validation Message should be "Please fill in this field."

  Scenario: Verify required attribute and maxlength for recipe title field
    Given I login with username "admin" and password "admin"
    When I go to "/en/node/add/recipe"
    Then the 'maxlength' attribute for '#edit-title-0-value' field should be '255'
    And the 'required' attribute for '#edit-title-0-value' field should be 'required'

  Scenario: Verify required attribute, min validation for Preparation time field
    Given I login with username "admin" and password "admin"
    When I go to "/en/node/add/recipe"
    Then the 'required' attribute for '#edit-field-preparation-time-0-value' field should be 'required'
    And the 'min' attribute for '#edit-field-preparation-time-0-value' field should be '0'
    And I fill in "Preparation time" with "-1"
    Then the "#edit-field-preparation-time-0-value" validation Message should be "Value must be greater than or equal to 0."


  Scenario: Verify required attribute, min validation for Number of servings field
    Given I login with username "admin" and password "admin"
    When I go to "/en/node/add/recipe"
    Then the 'required' attribute for '#edit-field-number-of-servings-0-value' field should be 'required'
    And the 'min' attribute for '#edit-field-number-of-servings-0-value' field should be '0'
    And I fill in "Number of servings" with "-1"
    Then the "#edit-field-number-of-servings-0-value" validation Message should be "Value must be greater than or equal to 0."

  Scenario: Verify required attribute for Difficulty field
    Given I login with username "admin" and password "admin"
    When I go to "/en/node/add/recipe"
    Then the 'required' attribute for '#edit-field-difficulty' field should be 'required'

  Scenario Outline: Verify required validation message for Media Image field
    Given I login with username "admin" and password "admin"
    When I am viewing a "recipe_category" term with the name "<recipe_category>"
    And I am viewing a "tags" term with the name "kashmiri sweets"
    And I go to "/en/node/add/recipe"
    And I should see "Create Recipe"
    And I fill in "Recipe Name" with "<recipe_name>"
    And I fill in "Preparation time" with "<preparation_time>"
    And I fill in "Cooking time" with "<cooking_time>"
    And I fill in "Number of servings" with "<number_of_servings>"
    And I select "<difficulty>" from "field_difficulty"
    And I wait for "2" seconds
    And I select "kashmiri sweets" from "Tags" autocomplete
    And I select "kashmiri" from "Recipe category" autocomplete
    And I fill in wysiwyg on field "edit-field-summary-0-value" with "ededede"
    And I fill in "field_ingredients[0][value]" with "<ingredient>"
    And I fill in wysiwyg on field "edit-field-recipe-instruction-0-value" with "boil for 2 mins"
    And I select "Published" from "Save as"
    And I press the "Save" button
    Then I should see the error message "This value should not be null."

    Examples:
      |recipe_name|preparation_time|cooking_time|number_of_servings|difficulty|recipe_category|ingredient|
      | Gulab jamun|60             |45          |4                 |Easy      |kashmiri       |Besan     |


  Scenario Outline: Verify required validation message for Summary field
    Given I login with username "admin" and password "admin"
    When I am viewing a "recipe_category" term with the name "<recipe_category>"
    And I am viewing a "tags" term with the name "kashmiri sweets"
    And I go to "/en/node/add/recipe"
    And I fill in "Recipe Name" with "<recipe_name>"
    And I fill in "Preparation time" with "<preparation_time>"
    And I fill in "Cooking time" with "<cooking_time>"
    And I fill in "Number of servings" with "<number_of_servings>"
    And I select "<difficulty>" from "field_difficulty"
    And I press "Add media"
    And I attach the file "ludo.png" to "Add file"
    And I wait for "2" seconds
    And I fill in "Alternative text" with "imagealttext"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I select "kashmiri sweets" from "Tags" autocomplete
    And I select "kashmiri" from "Recipe category" autocomplete
    And I fill in "field_ingredients[0][value]" with "<ingredient>"
    And I fill in wysiwyg on field "edit-field-recipe-instruction-0-value" with "boil for 2 mins"
    And I select "Published" from "Save as"
    And I press the "Save" button
    Then I should see the error message "Summary field is required."

    Examples:
      |recipe_name|preparation_time|cooking_time|number_of_servings|difficulty|recipe_category|ingredient|
      | Gulab jamun|60             |45          |4                 |Easy      |kashmiri       |Besan     |


  Scenario Outline: Verify required validation message for Recipe instruction field
    Given I login with username "admin" and password "admin"
    When I am viewing a "recipe_category" term with the name "<recipe_category>"
    And I am viewing a "tags" term with the name "kashmiri sweets"
    And I go to "/en/node/add/recipe"
    And I fill in "Recipe Name" with "<recipe_name>"
    And I fill in "Preparation time" with "<preparation_time>"
    And I fill in "Cooking time" with "<cooking_time>"
    And I fill in "Number of servings" with "<number_of_servings>"
    And I select "<difficulty>" from "field_difficulty"
    And I press "Add media"
    And I attach the file "ludo.png" to "Add file"
    And I wait for "2" seconds
    And I fill in "Alternative text" with "imagealttext"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I click on  "body > div.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.media-library-widget-modal.ui-dialog-buttons > div.ui-dialog-buttonpane.ui-widget-content.ui-helper-clearfix > div.ui-dialog-buttonset.form-actions > button"
    And I select "kashmiri sweets" from "Tags" autocomplete
    And I select "kashmiri" from "Recipe category" autocomplete
    And I fill in "field_ingredients[0][value]" with "<ingredient>"
    And I fill in wysiwyg on field "edit-field-summary-0-value" with "ededede"
    And I select "Published" from "Save as"
    And I press the "Save" button
    Then I should see the error message "Recipe instruction field is required."

    Examples:
      |recipe_name|preparation_time|cooking_time|number_of_servings|difficulty|recipe_category|ingredient|
      | Gulab jamun|60             |45          |4                 |Easy      |kashmiri       |Besan     |














