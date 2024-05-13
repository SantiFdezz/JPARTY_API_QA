Feature:


Background:
    * url baseUrl+"/user/session"
Scenario Outline: Get SessionToken and test events endpoint with different examples
    * def data = read('data/userValid.json')[1]
    And request data 
    When method post
    Then status 201
    * def SessionToken = response.SessionToken

    * url baseUrl+"/events"
    And header SessionToken = SessionToken
    And params <searchParams>
    And method get
    When status 200
    * print 'Events:', response 
    Examples:
    | searchParams                     |
    | read('data/validSearch.json')[0] |
    | read('data/validSearch.json')[1] |          