Feature: Register Feature on JPARTY API
    On this feature we are gonna test that the bbdd is working correctly when making post/get

Background:
    * url baseUrl + '/user'
Scenario: Create a new user with valid data
    * def data = read('data/userValid.json')[0]
    And request data
    When method post
    Then status 201
    And match response contains {"response": "ok"}

    * def userToken = response.SessionToken
    Given header SessionToken = userToken
    When method delete
    Then status 200
    And match response contains {"response": "ok"}

Scenario: Failed to create a new user invalid data
    * def data = read('data/userInvalid.json')[0]
    And request data
    When method post
    Then status 400
    And match response == {"response": "not_ok"}

Scenario: Failed to create a new user duplicated email
    * def data = read('data/userInvalid.json')[1]
    And request data
    When method post
    Then status 409
    And match response == {"response": "already_exist"}
