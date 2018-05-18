*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Scenario: Valid Payee
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Registered_Payee_Name]
    And he enters as amount    [a Valid Transfer Amount]
    And he Submits request for Fund Transfer
    Then the fund transfert must be completed

Scenario: Invalid Payee
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Not_Registered_Payee_Name]
    And he enters as amount    [a Valid Transfer Amount]
    And he Submits request for Fund Transfer
    Then a blocking error message must be displayed    [Error: Not_Registered_Payee]

Scenario: Too big amount for current account balance
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Registered_Payee_Name]
    And he enters as amount    [a_too_big_amount]
    And he Submits request for Fund Transfer
    Then a blocking error message must be displayed    [Error: Too_Big_Amount]

*** Keywords ***
the user is on Fund Transfer Page

he enters as payee name
    [Arguments]    ${arg1}
