@advanced-search @javascript @api
Feature: As an Authenticated user,
  I should be able to further drill down my search results,
  to obtain desired results

  @anonymous @both-languages
  Scenario Outline: As an anonymous user I should not be able to perform advanced search to further drill down my search results
    Given I am on "<url>"
    Then I should see "<search_text>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_text>"
    Then I should see "<search_result>"
    And I should not see "<advanced_search_text>"
    Examples:
      | url | search_text | search_field                                 | search_term | search_result  | advanced_search_text |
      | /   | Search      | Search by keyword, ingredient, dish          | egg         | Search for egg | Advanced search      |
      | /es | Buscar      | Buscar por palabra clave, ingrediente, plato | egg         | Buscar por egg | Búsqueda avanzada    |

  @authenticated @english
  Scenario Outline: As an authenticated user, I should be able to perform advanced search  by "Containing any of the words" and selecting type, language
    Given I am logged in as a user with the "administrator" role
    And I wait for page to load
    Then I should see "Search"
    And I fill in "Search by keyword, ingredient, dish" with "<search_term>"
    And I press "Search"
    Then I should see "Search for <search_term>"
    And I scroll to "#edit-advanced"
    And I should see "Advanced search"
    And I expand "#edit-advanced"
    And I should see "Keyword"
    And I fill in "Containing any of the words" with "<Contain_any_of_words>"
    And I should see "Types"
    And I should see "Only of the type(s)"
    And I check "<Only_of_the_type>"
    And I should see "Languages"
    And I check "<language>"
    And I click on  "#edit-submit--2"
    And I wait for page to load
    And I should see "<Result>"
    Examples:
      | search_term | Contain_any_of_words | Only_of_the_type | language | Result                                    |
      | egg         | Vegetarian           | Recipe           | English  | Crema catalana                            |
      | egg         | Pastry               | Recipe           | English  | Deep mediterranean quiche                 |
      | umami       | mushrooms            | Article          | English  | The Umami guide to our favorite mushrooms |
      | Let's hear  | a                    | Article          | English  | Let's hear it for carrots                 |
      | the         | the                  | Basic page       | Spanish  | Your search yielded no results.           |


  @authenticated @spanish
  Scenario Outline: As an authenticated user, I should be able to perform advanced search  by "Containing any of the words" and selecting type, language
    Given I am logged in as a user with the "administrator" role
    And I wait for page to load
    And I am on "/es"
    Then I should see "Buscar"
    And I fill in "Buscar por palabra clave, ingrediente, plato" with "<search_term>"
    And I press "Buscar"
    Then I should see "Buscar por <search_term>"
    And I scroll to "#edit-advanced"
    And I should see "Búsqueda avanzada"
    And I expand "#edit-advanced"
    And I should see "Palabras clave"
    And I fill in "Que contenga cualquiera de las palabras" with "<Contain_any_of_words>"
    And I should see "Tipos"
    And I should see "Sólo de los tipos"
    And I check "<Only_of_the_type>"
    And I should see "Idiomas"
    And I check "<language>"
    And I click on  "#edit-submit--2"
    And I wait for page to load
    And I should see "<Result>"
    Examples:
      | search_term | Contain_any_of_words | Only_of_the_type | language | Result                                    |
      | egg         | Vegetarian           | Receta           | Inglés  | Crema catalana                            |
      | egg         | Pastry               | Receta          | Inglés  | Deep mediterranean quiche                 |
      | umami       | mushrooms            | Artículo         | Inglés | The Umami guide to our favorite mushrooms |
      | Let's hear  | a                    | Artículo          | Inglés | Let's hear it for carrots                 |
      | the         | the                  | Página básica       | Español  | Su búsqueda no produjo resultados          |

  @authenticated @both-languages
  Scenario Outline: As an authenticated user, I should be able to perform advanced search  by "Containing the phrase" only
    Given I am logged in as a user with the "administrator" role
    And I wait for page to load
    And I am on "<url>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_button>"
    Then I should see "<search_term>"
    And I scroll to "#edit-advanced"
    And I expand "#edit-advanced"
    And I fill in "phrase" with "<Contain_the_phrase>"
    And I click on  "#edit-submit--2"
    And I wait for page to load
    And I should see "<Result>"

    Examples:
      |url|search_field                                   | search_term |search_button| Contain_the_phrase | Result|
      |/| Search by keyword, ingredient, dish             |umami |Search      | favorite mushrooms | The Umami guide to our favorite mushrooms |
      |/| Search by keyword, ingredient, dish             |umami |Search      | hello              | Your search yielded no results.           |
      |/es|Buscar por palabra clave, ingrediente, plato   | umami|Buscar      | hello              | Su búsqueda no produjo resultados         |
      |/es|Buscar por palabra clave, ingrediente, plato   |umami |Buscar      | hello              | Su búsqueda no produjo resultados         |



  @authenticated @both-languages
  Scenario Outline: As an authenticated user, I should be able to perform advanced search  by "Containing none of the words" only
    Given I am logged in as a user with the "administrator" role
    And I wait for page to load
    And I am on "<url>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_button>"
    Then I should see "<search_term>"
    And I scroll to "#edit-advanced"
    And I expand "#edit-advanced"
    And I fill in "negative" with "<Containing none of the words>"
    And I click on  "#edit-submit--2"
    And I wait for page to load
    And I should see "<Result>"

    Examples:
      | url | search_field                                 | search_term | search_button | Containing none of the words | Result                                    |
      | /   | Search by keyword, ingredient, dish          | butter       | Search        | chocolate         | Deep mediterranean quiche |
      | /   | Search by keyword, ingredient, dish          | butter      | Search         | large             | Dairy-free and delicious milk chocolate           |
      | /es | Buscar por palabra clave, ingrediente, plato | butter       | Buscar        | chocolate         | Deep mediterranean quiche        |
      | /es | Buscar por palabra clave, ingrediente, plato | butter      | Buscar         | large             | Dairy-free and delicious milk chocolate         |

