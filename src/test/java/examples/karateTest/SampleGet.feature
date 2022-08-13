Feature: Test demo API
  Scenario: Run a sample Get API
    Given url  'https://reqres.in/api/users?page=2'

    When method GET
    Then status 200
    And print response
