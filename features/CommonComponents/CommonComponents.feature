@common-components @javascript @api
Feature: Common components on header and footer for homepage, contact us page and Search results page

  As an end user
  I should be able to see common components on header and footer for homepage, contact-us page and Search results page

  @anonymous @pre-header
  Scenario Outline: As an anonymous user I should be able to see correct text  in common pre header region for homepage, contact us page and Search results page
    Given I go to "<page>"
    Then I should see "Español" in the "preheader" region
    And  I should see "English" in the "preheader" region
    And I should see "Search" in the "preheader" region
    And I should see "Log in" in the "preheader" region

     Examples:
      |page|
      |/|
      |/en/contact|
      |/en/search/node|

  @authenticated @pre-header
  Scenario Outline: As an authenticated user I should be able to see correct text  in common pre header region for homepage, contact us page and Search results page
    Given I am logged in as a user with the 'authenticated' role
    And I go to "<page>"
    Then I should see "Español" in the "preheader" region
    And  I should see "English" in the "preheader" region
    And I should see "Search" in the "preheader" region
    And I should see "My account" in the "preheader" region
    And I should see "Log out" in the "preheader" region
    But I should not see "Log in" in the "preheader" region
    Examples:
      |page|
      |/|
      |/en/contact|
      |/en/search/node|

  @anonymous @header
  Scenario Outline: As an anonymous user I should be able to see correct elements in common header region for homepage, contact us page and Search results page
    Given I go to "<page>"
    Then I should see "Home" in the "header" region
    And I should see "Articles" in the "header" region
    And I should see "Recipes" in the "header" region
    Examples:
      | page |
      |/|
      |/en/contact|
      |/en/search/node|

  @anonymous  @content-bottom
  Scenario Outline: As an anonymous user I should be able to see correct elements in common content bottom region
    Given I go to "<page>"
    Then I should see "Recipe collections" in the "content_bottom" region
    And  I should see "Alcohol free" in the "content_bottom" region
    And  I should see "Cake" in the "content_bottom" region
    And  I should see "Dairy-free" in the "content_bottom" region
    And  I should see "Egg" in the "content_bottom" region
    And  I should see "Baked" in the "content_bottom" region
    And  I should see "Carrots" in the "content_bottom" region
    And  I should see "Dessert" in the "content_bottom" region
    And  I should see "Grow your own" in the "content_bottom" region
    And  I should see "Baking" in the "content_bottom" region
    And  I should see "Chocolate" in the "content_bottom" region
    And  I should see "Dinner party" in the "content_bottom" region
    And  I should see "Healthy" in the "content_bottom" region
    And  I should see "Drinks" in the "content_bottom" region
    And  I should see "Cocktail party" in the "content_bottom" region
    And  I should see "Breakfast" in the "content_bottom" region
    And  I should see "Herbs" in the "content_bottom" region
    Examples:
      | page |
      |/|
      |/en/contact|
      |/en/search/node|

  @anonymous @footer
  Scenario Outline: As an anonymous user I should be able to see correct elements in common Footer region
    Given I go to "<page>"
    Then I should see "Umami Food Magazine" in the "footer" region
    And I should see "Tell us what you think" in the "footer" region
    And I should see "Skills and know-how. Magazine exclusive articles, recipes and plenty of reasons to get your copy today." in the "footer" region
    And I should see "Contact" in the "footer" region
    And I should see "Find out more" in the "footer" region
    Examples:
      | page |
      |/|
      |/en/contact|
      |/en/search/node|

  @anonymous @bottom
  Scenario Outline: As an anonymous user I should be able to see correct elements in common Bottom region
    Given I go to "<page>"
    Then I should see "Umami Magazine & Umami Publications is a fictional magazine and publisher for illustrative purposes only" in the "bottom" region
    And I should see "© 2021 Terms & Conditions" in the "bottom" region
    Examples:
      | page            |
      | /               |
      | /en/contact     |
      | /en/search/node |
