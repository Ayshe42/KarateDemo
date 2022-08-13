@demo4
Feature: Data Driven
  Background:
    * url 'http://localhost:8081/'

  Scenario Outline: Create, Read, Update and Delete
    Given path 'persons'
    And request
    """
    {
    "firstName": "<firstName>",
    "lastName": "<lastName>",
    "age": <age>,
    "address": "Chicago,USA",
    "phoneNumbers": "123-456-78910"
    }
    """
    When method POST
    Then status 201
    Then match response == '#object'

    Examples:
      | firstName | lastName | age |
      | A         | Value 2  | 21  |
      | B         | Value 2  | 22  |
      | C         |Value 2   |  23  |