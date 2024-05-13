Feature: Login Feature on JPARTY API
    On this feature we are gonna test the login 
Background:
    * url baseUrl+ '/user/session'
Scenario: User logged in succesfully
    * def data = read('data/userValid.json')[1]
    Given request data
    When method post
    Then status 201
    And match response contains {"response": "ok"}

