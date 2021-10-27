@search @javascript @api
Feature: Search and Advanced Search

  As an anonymous user
  I should be able to perform normal search and as authenticated user I should be able  perform
  advanced search in both English and Spanish interface

  # Demo the approach of passing language parameter in scenario outline to test multi-language interface
  @anonymous @both-languages
  Scenario Outline: As an anonymous user I should be able to perform basic keyword search
    Given I am on "<url>"
    Then I should see "<search_text>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_text>"
    And I should see "<search_results_text>"
    And I should see "<search_term>"
    Examples:
      | url | search_text | search_field                                 | search_results_text | search_term                  |
      | /   | Search      | Search by keyword, ingredient, dish          | Search results      | Deep mediterranean quiche    |
      | /es | Buscar      | Buscar por palabra clave, ingrediente, plato | Buscar por          | Quiche mediterráneo profundo |

  # Use upper-case OR to get more results. Example: cat OR dog (content contains either "cat" or "dog").
  @anonymous @both-languages
  Scenario Outline: As an anonymous user I should be able to perform basic keyword search using OR operation
    Given I am on "<url>"
    Then I should see "<search_text>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_text>"
    And I should see "<search_results_text>"
    Then I should see 'rasmalai' or 'pizza' in search results
    Examples:
      | url | search_text | search_field                                 | search_results_text | search_term       |
      | /   | Search      | Search by keyword, ingredient, dish          | Search results      | rasmalai OR pizza |
      | /es | Buscar      | Buscar por palabra clave, ingrediente, plato | Buscar por          | rasmalai OR pizza |

  #  Use upper-case AND to require all words, but this is the same as the default behavior. Example:
  #  cat AND dog (same as cat dog, content must contain both "cat" and "dog").
  @anonymous @both-languages
  Scenario Outline: As an anonymous user I should be able to perform basic keyword search using AND operation
    Given I am on "<url>"
    Then I should see "<search_text>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_text>"
    And I should see "<search_results_text>"
    Then I should see 'chocolate' and 'brownies' in search results

    Examples:
      | url | search_text | search_field                                 | search_results_text | search_term            |
      | /   | Search      | Search by keyword, ingredient, dish          | Search results      | chocolate AND brownies |
      | /es | Buscar      | Buscar por palabra clave, ingrediente, plato | Buscar por          | chocolate AND brownies |

#  You can precede keywords by - to exclude them; you must still
#  have at least one "positive" keyword.
#  Example: cat -dog (content must contain cat and cannot contain dog).
  @anonymous @both-languages
  Scenario Outline: As an anonymous user I should be able to use negate operator for drilling down search results
    Given I am on "<url>"
    Then I should see "<search_text>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_text>"
    And I should see "<search_results_text>"
    Then I should see 'Chocolate' and not 'brownies' in search results

    Examples:
      | url | search_text | search_field                                 | search_results_text | search_term            |
      | /   | Search      | Search by keyword, ingredient, dish          | Search results      | chocolate -brownies    |
      | /es | Buscar      | Buscar por palabra clave, ingrediente, plato | Buscar por          | chocolate -brownies |



  #  Use quotes to search for a phrase. Example: "the cat eats mice".
  @anonymous @both-languages
  Scenario Outline: As an anonymous user I should be able to search phrase using quotes
    Given I am on "<url>"
    Then I should see "<search_text>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_text>"
    And I should see "<search_results_text>"
    Then I should see "Take care when handling chili peppers" in the "p.search-result__snippet > strong" element

    Examples:
      | url | search_text | search_field                                 | search_results_text | search_term                               |
      | /   | Search      | Search by keyword, ingredient, dish          | Search results      | \"Take care when handling chili peppers\" |
      | /es | Buscar      | Buscar por palabra clave, ingrediente, plato | Buscar por          | \"Take care when handling chili peppers\" |

  @anonymous @english
  Scenario Outline: As an anonymous user I should be able to perform  partial keyword search
    Given I am on "<url>"
    Then I should see "<search_text>"
    And I fill in "<search_field>" with "<search_term>"
    And I press "<search_text>"
    And I should see "<search_term>" term in results
    Examples:
      | url | search_text | search_field                        | search_results_text | search_term |
      | /   | Search      | Search by keyword, ingredient, dish | Search results      | cakes       |


  @anonymous @english
  Scenario: As an end user I should be presented with proper message if I search without entering keyword
    Given I am on "/"
    Then I should see "Search"
    And I fill in "Search by keyword, ingredient, dish" with ""
    And I press "Search"
    Then I should see the error message "Please enter some keywords"

  @anonymous @english
  Scenario: As an anonymous user I should be presented with proper message if I search with keyword less than 3 characters
    Given I am on "/"
    Then I should see "Search"
    And I fill in "Search by keyword, ingredient, dish" with "s"
    And I press "Search"
    Then I should see the warning message "You must include at least one keyword to match in the content. Keywords must be at least 3 characters, and punctuation is ignored."
    And I should see "Your search yielded no results."

  @anonymous @english
  Scenario: As an anonymous user I should be presented with pagination if search term has more results
    Given I am on "/"
    Then I should see "Search"
    And I fill in "Search by keyword, ingredient, dish" with "umami"
    And I press "Search"
    Then I should see "1"
    And I should see "2"
    And I should see "Next"
    And I should see "Last"

  @anonymous @english
  Scenario: As an  user If I search for unpublished content, I should see message "Your search yielded no results."
    Given  I am logged in as a user with the "administrator" role
    When   I am viewing an page:
      | title            | Pub node         |
      | body             | body lorum ipsum |
      | moderation_state | draft            |
    And  I run cron
    And am on "admin/reports/dblog"
    Then I should see the link "Cron run completed"
    And I logout
    And I am on "/"
    Then I should see "Search"
    And I fill in "Search by keyword, ingredient, dish" with "Pub node"
    And I press "Search"
    And I should see "Your search yielded no results."



