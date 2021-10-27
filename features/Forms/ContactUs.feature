@contact-us @api
Feature: Contact us form multilingual interface
  As an anonymous user
  I should be able to submit contact us form using both English and Spanish language interface

  # Health check to see contact us page is working/loading fine
  Scenario: Assert Page title for Contact Us page is "Website Feedback"
    Given I am on "/en/contact"
    Then I should get a "200" HTTP response
    And I should see "Website feedback" in the ".page-title" element

  # Assert labels of contact us page fields
  @javascript @english @anonymous
  Scenario: Check labels of fields given on contact us page are as expected
    Given I am on "/en/contact"
    Then I should see "Your name"
    And I should see "Your email address"
    And I should see "Subject"
    And I should see "Message"

  # Submit contact us form with correct data and assert Success message
  @javascript @english @anonymous @api
  Scenario: Submit form in English interface and assert success message
    Given I am on "/en/contact"
    When I fill in the following:
      | name              | Sami2        |
      | mail              | s2@b.com     |
      | subject[0][value] | hello sub2   |
      | message[0][value] | Hello there2 |
    And I print the current url
    And I press "Send message"
    Then I should see the success message "Your message has been sent."
    Then I am on "/en"



  # Submit contact us form with email address in wrong syntax and assert error message in js popup
  @javascript @english @anonymous
  Scenario: Submit form in English interface with email address in wrong syntax and assert error message in js popup
    Given I am on "/en/contact"
    When I fill in the following:
      | name              | Sami2         |
      | mail              | s2            |
      | subject[0][value] | hello sub22   |
      | message[0][value] | Hello there22 |
    And I submit the form
    And I wait for page to load
    And I scroll to "#edit-mail"
    Then the "#edit-mail" validation Message should be "Please include an '@' in the email address. 's2' is missing an '@'."

  # Submit contact us form with empty field like name  and assert error message in js popup
  @javascript @english @anonymous
  Scenario: Submit form in English interface with empty name field and assert error message in js popup
    Given I am on "/en/contact"
    When I fill in the following:
      | name              |                |
      | mail              | s2             |
      | subject[0][value] | hello sub222   |
      | message[0][value] | Hello there222 |
    And I submit the form
    And I wait for page to load
    Then the "#edit-name" validation Message should be "Please fill in this field."


   # Submit contact us form with spaces in Subject and Message field and assert drupal error message
  @javascript @english @anonymous
  Scenario: Submit form in English interface  with spaces in Subject and Message field and assert drupal error message
    Given I am on "/en/contact"
    When I fill in the following:
      | name              | sami               |
      | mail              | s2@s.com           |
    And I fill in "Subject" with " "
    And I fill in "Message" with " "
    And I submit the form
    And I wait for page to load
    Then I should see the error message "Subject field is required."
    And I should see the error message "Message field is required."

  # Check labels of fields given on contact us page when language is switched to spanish
  @javascript @spanish @anonymous
  Scenario: Check labels of fields given on contact us page when language is switched to spanish
    Given I am on "/es/contact"
    Then the url should match "/es/contact"
    And I should see "Su nombre"
    And I should see "Su dirección de correo electrónico"
    And I should see "Asunto"
    And I should see "Mensaje"


  # Submit contact us form by switching language
  @javascript @spanish @anonymous
  Scenario: Submit contact us form by switching language to spanish
    Given I am on "/es/contact"
    And I wait for page to load
    And I fill in "Su nombre" with "Spanish name"
    And I fill in "Su dirección de correo electrónico" with "spain@test.com"
    And I fill in "Asunto" with "Hello gracias"
    And I fill in "Mensaje" with "Hello messago"
    And I press "Enviar mensaje"
    And I wait for page to load
    Then I should see the success message "Su mensaje ha sido enviado."
    Then I am on "/es"

  # Submit contact us form by authenticated user and assert watchdog message for same as admin
  @api @javascript @authenticated
  Scenario: As an authenticated user I should be able to submit contact us form
    Given I am logged in as a user with the "authenticated" role
    But I should not see "Log in" in the "preheader" region
    And I follow "Contact"
    Then I should see "Website feedback"
    When I fill in the following:
      | subject[0][value] | hello sub222   |
      | message[0][value] | Hello there222 |
    And I press "Send message"
    Then I should see "Your message has been sent." in the "highlighted" region
    And I am logged in as a user with the "administrator" role
    And  am on "admin/reports/dblog"
    Then I should see the link "sent an email regarding"


 # Submit contact us form five times and observe error message
  @javascript @anonymous
  Scenario: Submit form in English interface five times  and assert error message
    Given I am on "/"
    When I fill in form "6" times
    Then I should see the error message "You cannot send more than 5 messages in 1 hour. Try again later."
































