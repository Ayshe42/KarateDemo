Feature: Create user using post api

  Background:
    * url 'https://gorest.co.in'

    * def random_string =
	"""
		function(s){
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for(var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
		}
	"""
    * def randomString = random_string(10)
    * print randomString

    * def requestPayload =
	"""
	{
        "name": "tom",
        "gender": "male",
        "status": "active"
    }
	"""
    * requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'tom'
    And match $.data.email == requestPayload.email
    #fetch the user Id
  * def userId = $.data.id
    * print usrId
    # delete same userId
#Delete user with userID
    Given path '/public/v1/users/'+ userId
    And header Authorization = 'Bearer ' + tokenID
    When method delete
    Then status 204
    #Get the user with userId
    Given path '/public/v1/users/'
    And header Authorization = 'Bearer ' + tokenID
    When method GET
    Then status 404
    And match $.data.message == 'Resourge not found'