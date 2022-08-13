Feature: Post demo  API
# Simple Post scenario
Scenario: Post demo 1
Given url 'https://reqres.in/api/users'
And request { "name": "Ayse2", "job": "QA Engineer"}
When method post
Then status 201
