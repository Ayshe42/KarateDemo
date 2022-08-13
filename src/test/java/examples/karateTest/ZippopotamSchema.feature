
Feature: JSON Schema Validation
  Scenario: Get Verify its JSON Fields
    * url 'http://api.zippopotam.us'
    * header Accept = 'application/json'
    Given path '/us/90210'
    When method get
    Then status 200
    Then match response == '#object'
    * def jsonSchemaExpected =
"""
  {
"post code": "#string",
"country": "#string",
"country abbreviation": "#string",
"places": [
{
"place name": "#string",
"longitude": "#string",
"state": "#string",
"state abbreviation": "#string",
"latitude": "#string"
}
]
}
"""
    * match response == jsonSchemaExpected
