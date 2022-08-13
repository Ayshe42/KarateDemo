@Demo
Feature: Get API Demo
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('Result1.json')

  # A simple Get API Scenario
  Scenario: Get demo 1
    Given url 'https://reqres.in/api/users/3'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies


  # With Background  and Path
  Scenario: Get demo 2
    Given path '/users/2'
    When method GET
    Then status 200
  And assert response == "#notnull"
  And assert response.arr.length == 2
  And match $.data.id == 2
  And match $.data.first_name == 'Janet'
  # With Backgorund, path and params
  Scenario: Get demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200

  # With Assertions
  Scenario: Get demo 4
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name == 'Byron'
    And assert response.data.length == 6
    And match $.data[1].id == 8
    And match $.data[3].last_name == 'Fields'

  # Read and Assert response from file
  Scenario: Get demo 5
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And assert response.data.length == 6
    And match $.data[1].id == 8
    And match $.data[3].last_name == 'Fields'
    And match response == expectedOutput
    And match $ == expectedOutput
