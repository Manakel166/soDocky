*** Settings ***
Test Teardown     Close Browser
Default Tags      OnlineBanking
Resource          OnlineBanking.gui.txt
Resource          OnlineBanking.api.txt

*** Variables ***
${Transfer_Amount}    NOT_DEFINED
${Payee_Name}     NOT_DEFINED
${ExecutionMode}    API    #API(API based testing) or GUI (GUI based testing)

*** Test Cases ***
Scenario: Valid Payee
    [Tags]    NOMINAL
    [Setup]    ConfigureTestLevel
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Registered_Payee_Name]
    And he enters as amount    [a_Valid_Transfer_Amount]
    And he Submits request for Fund Transfer
    Then the fund transfert must be completed

Scenario: Invalid Payee
    [Tags]    ERREUR
    [Setup]    ConfigureTestLevel
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Not_Registered_Payee_Name]
    And he enters as amount    [a_Valid_Transfer_Amount]
    And he Submits request for Fund Transfer
    Then a blocking error message must be displayed    [Error: Not_Registered_Payee]

Scenario: Too big amount for current account balance
    [Tags]    ERREUR
    [Setup]    ConfigureTestLevel
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Registered_Payee_Name]
    And he enters as amount    [a_Too_Big_Amount]
    And he Submits request for Fund Transfer
    Then a blocking error message must be displayed    [Error: Too_Big_Amount]

*** Keywords ***
ConfigureTestLevel
    Run Keyword If    '${ExecutionMode}'=='API'    Set Library Search Order    OnlineBanking.api    OnlineBanking.gui
    Run Keyword If    '${ExecutionMode}'=='GUI'    Set Library Search Order    OnlineBanking.gui    OnlineBanking.api
