
Feature:update the user information
  Scenario: Patch  call to update the user information
    * def requestPatchPayload =
    """
    {
	"name": "John Doe"
     }
    """
Given url 'https://api.instantwebtools.net/v1/passenger/1'
And request requestPatchPayload
When method put
Then status 200
And match $.data.name == 'tom'
And match $.data.email == requestPayload.email
* print response

