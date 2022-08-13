@PostDemo
Feature: Post demo  API
Background:
* url 'https://reqres.in/api'
* header Accept = 'application/json'

# Post scenario with Background
Scenario: Post demo 2
Given path '/users'
And request { "name": "Ayse", "job": "QA Engineer"}
When method post
Then status 201

  # Post with response assertion
Scenario: Post demo 3
Given path '/users'
And request { "name": "Ayse", "job": "QA Engineer"}
When method post
Then status 201
And match response == {"name": "Ayse", "job": "QA Engineer","id": "#string","createdAt": "#ignore"}

