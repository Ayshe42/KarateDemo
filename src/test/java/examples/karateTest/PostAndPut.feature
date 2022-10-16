Feature:Create record and update the record
  Scenario: Post  Request
    * def requestPostPayload =
    """
 {
    "name": "John Doe67",
    "trips": 250
}
    """
    Given url 'https://api.instantwebtools.net/v1/passenger'
    And request requestPostPayload
    When method post
    Then status 201
  Scenario: Put Request
    * def id = "6062166d23e0165d7e0929a8"
    * def requestPutPayload =
    """
      {
    "name": "John Doe",
    "trips": 500,
    "airline": 8
}

    """
    Given url 'https://api.instantwebtools.net/v1/passenger/'+ id
    And request requestPutPayload
    When method put
    Then status 201