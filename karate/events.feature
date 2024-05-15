Feature: Session and Events Test

Background:
    * url baseUrl+"/user/session"
    * def data = read('data/userValid.json')[1]
    * def sorted = read('utils/isSorted.js')
    And request data 
    When method post
    Then status 201
    * def SessionToken = response.SessionToken

Scenario Outline: Get SessionToken and test events endpoint with different examples
    
    * url baseUrl+"/events"
    And header SessionToken = SessionToken
    And params <searchParams>
    And method get
    When status 200
    * def responseEvent = response
    * print 'Events: ' + JSON.stringify(responseEvent)
    * def isSorted = sorted(responseEvent, <searchParams>, data)
    Then assert isSorted == true

    Examples:
    | searchParams                     |
    | read('data/validSearch.json')[0] |
    | read('data/validSearch.json')[1] |
    | read('data/validSearch.json')[2] |