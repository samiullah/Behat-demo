<?php


use Behat\Behat\Hook\Scope\AfterStepScope;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Mink\Element\NodeElement;
use Behat\Mink\Exception\DriverException;
use Behat\Mink\Exception\UnsupportedDriverActionException;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Drupal\node\Entity\Node;
use Webmozart\Assert\Assert;


//use DMore\ChromeDriver\ChromeDriver;use DMore\ChromeDriver\ChromeDriver;

//use Drupal\DrupalExtension\Features\bootstrap\Feature
//vendor/drupal/drupal-extension/features/bootstrap/FeatureContext.php

//use PHPUnit\Framework\TestCase;

/**
 * FeatureContext class defines custom step definitions for Behat.
 */
class FeatureContext extends RawDrupalContext
{

  /**
   * Every scenario gets its own context instance.
   *
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct()
  {

  }

  /**
   * @Given /^I wait for "([^"]*)" seconds$/
   */
  public function iWaitForSeconds($seconds)
  {
    sleep($seconds);
  }

  /**
   * @Given /^I submit the form$/
   */
  public function iSubmitTheForm()
  {
    $this->getSession()->getPage()->find('xpath', "//input[@value='Send message']")->click();

  }


  /**
   * @Then /^I should see validation message for "([^"]*)" with "([^"]*)"$/
   * @throws \Exception
   */
  public function iShouldSeeInPopup($arg1, $arg2)

  {
    $function = <<<JS
        (
            function()
            {
                return document.querySelector("$arg1").validationMessage
            })()
    JS;
    try {
      if ($this->getSession()->evaluateScript($function) === '$arg2') {
        throw new \Exception("validationMessage did not match");
      }
    } catch (\Exception $e) {
      throw new \Exception("Scroll Into View Failed. Check Your Script");
    }
  }

  /**
   * @Given /^I print the current url$/
   */
  public function iPrintTheCurrentUrl()
  {
    $url = $this->getSession()->getCurrentUrl();
    print_r($url);
  }

  /**
   * @When /^I login with username "([^"]*)" and password "([^"]*)"$/
   */
  public function iLoginAsUser($arg1, $arg2)
  {
    $this->visitPath("/user/login");
    $this->iWaitForPageToLoad();
    $username = $this->getSession()->getPage()->findField("name");
    $username->setValue($arg1);
    $this->iWaitForPageToLoad();
    $password = $this->getSession()->getPage()->findField("pass");
    $password->setValue($arg2);
    $this->iWaitForPageToLoad();
    $login_button = $this->getSession()->getPage()->find('xpath', "//input[@value='Log in']");
    $login_button->click();
    $this->iWaitForPageToLoad();
  }


  /**
   * @Given /^I am on the "([^"]*)"$/
   */
  public function iAmOnThe($arg1)
  {

    $this->getSession()->getDriver()->visit($arg1);

  }


  /**
   * Wait for a specified time until an element is found.
   *
   * @param $selector -  Selectors like css path, xpath path, label etc.
   * @param string $type - Type of Mink Selector css, xpath, named etc.
   * @param int $wait - Max wait time.
   * @return \Behat\Mink\Element\NodeElement|false|NodeElement|null
   */
  public function waitForElement($selector, $type = 'css', $wait = 10)
  {
    // Wait until max timeout.
    while ($wait > 0) {
      // Check for Element.
      $element = $this->getSession()->getPage()->find($type, $selector);
      if (!is_null($element)) {
        return $element;
      } else {
        // Wait for 1 sec and continue.
        sleep(1);
        $wait--;
      }
    }
    return false;
  }


  /**
   * @Then I fill in wysiwyg on field :locator with :value
   */
  public function iFillInWysiwygOnFieldWith($locator, $value)
  {
    $el = $this->getSession()->getPage()->findField($locator);
    // fix needed for raising exception
//    if (empty($el)) {
//      Assert::
//      throw new ExpectationException('Could not find WYSIWYG with locator: ' . $locator, $this->getSession());
//    }

    $fieldId = $el->getAttribute('id');
    // fix needed for raising exception
//    if (empty($fieldId)) {
//      throw new Exception('Could not find an id for field with locator: ' . $locator);
//    }

    $this->getSession()
      ->executeScript("CKEDITOR.instances[\"$fieldId\"].setData(\"$value\");");
  }

  /**
   * @Given /^I expand "([^"]*)"$/
   */
  public function iExpand($arg1)
  {
    $script = <<< JS

;(function($) {
   return document.querySelector('$arg1').setAttribute('open','');
})(jQuery);

JS;
    $this->getSession()->executeScript($script);

  }

  /**
   * @Given /^I wait for page to load$/
   */
  public function iWaitForPageToLoad()
  {
    $this->getSession()->wait(60000, 'document.readyState == "complete"');
  }


  /**
   * @Then I scroll to :arg1
   */
  public function iScrollTo($arg1)
  {
    $script = <<< JS

;(function($) {
   return document.querySelector('$arg1').scrollIntoView();
})(jQuery);

JS;
    $this->getSession()->executeScript($script);

  }

  /**
   * @Then I click on  :arg1
   */
  public function iClickOn($arg1)
  {
    $script = <<< JS

      ;(function($) {
         return document.querySelector('$arg1').click();
      })(jQuery);

      JS;
    $this->getSession()->executeScript($script);

  }

  /**
   * @Given /^I wait for Ajax to load$/
   */
  public function iWaitForAjaxToLoad($wait = 30)
  {
    $script = "(jQuery.active === 0 && jQuery(':animated').length === 0 && jQuery('.is-loading').length === 0)";
    $this->getSession()
      ->wait($wait, $script);
  }

  /**
   * @Given /^I logout$/
   */
  public function iLogout()
  {
    $this->visitPath('user/logout');
    $login = $this->getSession()->getPage()->hasContent('Log in');
    Assert::notFalse($login);
  }


  /**
   * Wait until Ajax call and Loading DX8 animation is finished.
   *
   * @var $wait - Max wait time in seconds.
   */
  public function waitForAjaxAndAnimation($wait = 30)
  {
    $script = "(jQuery.active === 0 && jQuery(':animated').length === 0 && jQuery('.is-loading').length === 0)";
    $this->getSession()
      ->wait($wait, $script);
  }

  /**
   * @Given /^I select "([^"]*)" from "([^"]*)" autocomplete$/
   */
  public function iSelectFromAutocomplete($value, $field)
  {
    $fieldElement = $this->getSession()->getPage()->findField($field);
    $this->getSession()->getPage()->fillField($field, $value);

    $xpath = $fieldElement->getXpath();
    try {
      $this->getSession()->getDriver()->keyDown($xpath, 13);
    } catch (UnsupportedDriverActionException | DriverException $e) {
    }

  }


  /**
   * @BeforeScenario
   *
   * @param BeforeScenarioScope $scope
   *
   */
  public function setUpTestEnvironment(BeforeScenarioScope $scope)
  {
    $this->currentScenario = $scope->getScenario();
  }

  /**
   * @AfterStep
   *
   * @param AfterStepScope $scope
   */
  public function afterStep(AfterStepScope $scope)
  {
    //if test has failed, and is not an api test, get screenshot
    if (!$scope->getTestResult()->isPassed()) {
      //create filename string

      $featureFolder = preg_replace('/\W/', '', $scope->getFeature()->getTitle());

      $scenarioName = $this->currentScenario->getTitle();
      $fileName = preg_replace('/\W/', '', $scenarioName) . '.png';

      //create screenshots directory if it doesn't exist
      if (!file_exists('results/html/assets/screenshots/' . $featureFolder)) {
        mkdir('results/html/assets/screenshots/' . $featureFolder);
      }

      //take screenshot and save as the previously defined filename
//      $this->driver->takeScreenshot('results/html/assets/screenshots/' . $featureFolder . '/' . $fileName);
      // For Selenium2 Driver you can use:
      file_put_contents('results/html/assets/screenshots/' . $featureFolder . '/' . $fileName, $this->getSession()->getDriver()->getScreenshot());
    }
  }

  /**
   * @When /^I revert to oldest revision$/
   */
  public function iRevertToOldestRevision()
  {
    $script = <<< JS

      ;(function($) {
         return document.querySelector('#block-seven-content > table > tbody > tr.even > td:last-child > div > div > ul > li.revert.dropbutton-action > a').click();
      })(jQuery);

      JS;
    $this->getSession()->executeScript($script);

  }

  /**
   * @Then select :select should not have an option :option
   */
  public function selectShouldNotHaveOption($select, $option)
  {
    $selectElement = $this->getSession()->getPage()->findField($select);
    if (is_null($selectElement)) {
      throw new \InvalidArgumentException(sprintf('Element "%s" is not found.', $select));
    }

    $optionElement = $selectElement->find('named', ['option', $option]);
    if (!is_null($optionElement)) {
      throw new \InvalidArgumentException(sprintf('Option "%s" is found in select "%s", but should not.', $option, $select));
    }
  }

  /**
   * @BeforeScenario @data_create
   * @throws \Drupal\Core\Entity\EntityStorageException
   */
  public static function setupScenario()
  {
    $node = Node::create([
      'type' => 'page',
      'title' => 'Welcome Test page',
      'body' => [
        'value' => 'Welcome to the site. Please add some content.',
      ],
      'moderation_state' => 'draft',
      // Set the uid to be the admin instead of it being null.
      'uid' => 1,
    ]);
    $node->save();
    echo "Data is created";
  }

  /**
   * @When /^I delete oldest revision$/
   */
  public function iDeleteOldestRevision()
  {
    $script = <<< JS

      ;(function($) {
         return document.querySelector('#block-seven-content > table > tbody > tr:last-child  > td:last-child  > div > div > ul > li.delete.dropbutton-action.secondary-action > a').click();
      })(jQuery);

      JS;
    $this->getSession()->executeScript($script);

  }


  /**
   * @Given /^I should see "([^"]*)" term in results$/
   */
  public function iShouldSeeSearchResultsFor($arg1)
  {
    $allResults = $this->getSession()->getPage()->findAll('css', '.search-result__title');

    foreach ($allResults as $Result) {
      $actualResult = $Result->find('css', 'a')->getText();

      // Use Stripos for case insenstive search of index of first occurence
      if (stripos($actualResult, $arg1)) {
        echo "Search term gave correct result on first page";
//        break;

      } else {
        $noResult = $this->getSession()->getPage()->hasContent('Your search yielded no results.');
        if ($noResult) {
          echo "No results found";

        }

        $pagination = $this->getSession()->getPage()->hasContent('Next');
        if ($pagination) {
          echo "Need to move to next page";

          $this->getSession()->getPage()->find('css', '#block-umami-content > nav > ul > li.pager__item.pager__item--next > a')->click();
          $actualResult = $Result->find('css', 'a')->getText();
          if (stripos($actualResult, $arg1)) {
            echo "Search term gave correct result on nth page";

          } else {
            echo "Search query not found on any  pages";
          }
          break;
        }
      }
    }

  }


  /**
   * Compare the validationMessage of given element.
   * @Then /^the "([^"]*)" validation Message should be "([^"]*)"$/
   * @throws Exception
   */
  public function theValidationMessageShouldBe($css, $expected)
  {
    $function = <<<JS
        (
            function()
            {
                return document.querySelector("$css").validationMessage
            })()
JS;
    $actual = $this->getSession()->evaluateScript($function);
    echo "$actual";
    if ($actual !== $expected) {
      throw new \Exception(sprintf("Expected validationMessage attribute value '%s' doesn't match with actual value '%s'", $expected, $actual));
    }
  }

  /**
   * @Given /^the \'([^\']*)\' attribute for \'([^\']*)\' field should be \'([^\']*)\'$/
   * @throws Exception
   */
  public function theMaxlengthAttributeForFieldShouldBe($attribute, $css, $expected)
  {
    $function = <<<JS
        (
            function()
            {
                return document.querySelector("$css").getAttribute('$attribute')
            })()
JS;
    $actual = $this->getSession()->evaluateScript($function);
    echo "$actual";
    if ($actual !== $expected) {
      throw new \Exception(sprintf("Expected   attribute value '%s' doesn't match with actual value '%s'", $expected, $actual));
    }
  }

  /**
   * Waits for a CKEditor button and returns it when available and visible.
   *
   * @param string $name
   *   The name of the button, such as `drupallink`, `source`, etc.
   * @param string $instance_id
   *   (optional) The CKEditor instance ID. Defaults to 'edit-body-0-value'.
   *
   * @return \Behat\Mink\Element\NodeElement|null
   *   The page element node if found, NULL if not.
   */
  /**
   * @Given /^I should see \'([^\']*)\' in wysiwyg toolbar$/
   * @throws Exception
   */
  public function getEditorButton($name)
  {
    $this->getSession()->switchToIFrame();

    $button = $this->waitforElement("#cke_edit-body-0-value a.cke_button__" . $name, "css");
    if ($button == NULL) {
      throw new \Exception(sprintf("Expected   button '%s' doesn't match with actual value '%s'", !NULL, $button));
    }
  }

  /**
   * @When /^I fill in form "([^"]*)" times$/
   */
  public function iFillInFormFiveTimes($arg1)
  {

    $form = $this->getSession()->getPage();
    for ($i = 0; $i <= $arg1; $i++) {
      $this->visitPath('/contact');
      $form->fillField('Your name', "hello");
      $form->fillField('Your email address', 'sami@sami.com');
      $form->fillField('Subject', 'subject');
      $form->fillField('Message', 'hello world');
      $form->findButton('edit-submit')->click();
      sleep(1);
    }
  }


  /**
   * @Given /^I should see \'([^\']*)\' or \'([^\']*)\' in search results$/
   * @throws Exception
   */
  public function iShouldSeeInTheSearchResults($expectedText1, $expectedText2)
  {
    $allElements = $this->getSession()->getPage()->findAll('css', 'p.search-result__snippet > strong');
    $items = array();
    foreach ($allElements as $element) {
      $actualText = $element->getText();
      $items[] = $actualText;
    }

    if (in_array($expectedText1, $items) || in_array($expectedText2, $items)) {
      echo "Either of the items is present in search results";
    } else {
      throw new Exception("Neither of expected values are present in search results");

    }
  }

  /**
   * @Then /^I should see \'([^\']*)\' and \'([^\']*)\' in search results$/
   * @throws Exception
   */
  public function iShouldSeeAndInSearchResults($expectedText1, $expectedText2)
  {
    $allSearchElements = $this->getSession()->getPage()->findAll('css', 'p.search-result__snippet > strong');
    $items = array();
    foreach ($allSearchElements as $element) {
      $actualText = $element->getText();
      $items[] = $actualText;
    }

    if (in_array($expectedText1, $items) && in_array($expectedText2, $items)) {
      echo "Both results are found in search";
    } else {
      throw new Exception("Content must not be containing either one or both expected search term");

    }

  }

  /**
   * @Then /^I should see \'([^\']*)\' and not \'([^\']*)\' in search results$/
   * @throws Exception
   */
  public function iShouldSeeAndNotInSearchResults($expectedText1, $expectedText2)
  {
    $allSearchElements = $this->getSession()->getPage()->findAll('css', 'p.search-result__snippet > strong');
    $items = array();
    foreach ($allSearchElements as $element) {
      $actualText = $element->getText();
      $items[] = $actualText;
    }

    if (in_array($expectedText1, $items) && !(in_array($expectedText2, $items))) {
      echo "$expectedText1 is shown and $expectedText2 is not show in search results";
    } else {
      throw new Exception("no content found");

    }
  }


}

