Feature: Sample feature

  Scenario: A simple google search
    Given I visit the google home page
    Then I should be able to search for 'watir-webdriver'

  Scenario: An invalid google search
    Given I open a blank browser
    Then I should not be able to search for 'watir-webdriver'

  Scenario: Testing if the test actually fails
    Given I open a blank browser
    Then I should be able to search for 'watir-webdriver'
