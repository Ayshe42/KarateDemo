Feature: Post demo  API
Background:
* url 'https://reqres.in/api'
* header Accept = 'application/json'
* def expectedOutput = read('userInfo.json')

 # Post with response matching from file
Scenario: Post demo 4
Given path '/users'
And request { "name": "Ayse", "job": "QA Engineer"}
When method post
Then status 201
And match response == expectedOutput
And match $ == expectedOutput

  # Read body data from file
Scenario: Post demo 5
Given path '/users'
And def requestBody = read('userInfo.json')
And request requestBody
When method post
Then status 201
  And match response == read("userInfo.json")
  And request requestBody

# Read body data from file and change request values
Scenario: Post demo 7
Given path '/users'
And def requestBody = read('userInfo.json')
And request requestBody
And set requestBody.job = 'engineer'
When method post
Then status 201