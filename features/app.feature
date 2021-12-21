Feature: App

  Scenario: Home page
    Given I am a guest
    When I view the home page
    Then I see 'Hello World!'
