*** Settings ***
Resource          OnlineBanking.page.txt    # Shared Keyword Library

*** Variables ***
${url_OnlineBanking}    http://127.0.0.1:1026
${url_selenium_grid}    http://127.0.0.1:4441/wd/hub

*** Test Cases ***
Scenario: Valid Payee
    [Tags]    WEB    NOMINAL
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Registered_Payee_Name]
    And he enters as amount    [a_Valid_Transfer_Amount]
    And he Submits request for Fund Transfer
    Then the fund transfert must be completed
    [Teardown]    Close Browser

Scenario: Invalid Payee
    [Tags]    WEB    ISSUE
    Given the user is on Fund Transfer Page
    Fail
    When he enters as payee name    [a_Not_Registered_Payee_Name]
    And he enters as amount    [a_Valid_Transfer_Amount]
    And he Submits request for Fund Transfer
    Then a blocking error message must be displayed    [Error: Not_Registered_Payee]
    [Teardown]    Close Browser

Scenario: Too big amount for current account balance
    [Tags]    WEB    ISSUE
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Registered_Payee_Name]
    And he enters as amount    [a_Too_Big_Amount]
    And he Submits request for Fund Transfer
    Then a blocking error message must be displayed    [Error: Too_Big_Amount]
    [Teardown]    Close Browser

*** Keywords ***
------------------------Application or Page Keywords ---------------------------------------

----------------------------Business Steps / keywords ---------------------------------

a blocking error message must be displayed
    [Arguments]    ${arg1}
    Run Keyword if    '${arg1}'=='[Error: Too_Big_Amount]'    On DepositPage, Check Blocking Error Message:    ERROR:AMOUNT_TOO_BIG
    Run Keyword if    '${arg1}'=='[Error: Not_Registered_Payee]'    On DepositPage, Check Blocking Error Message:    ERROR:PAYEE_NOT_REGISTERED

he Submits request for Fund Transfer
    On DepositPage, Validate the Transfer Request

he enters as amount
    [Arguments]    ${arg1}
    On DepositPage, Enter the Transfer Amount    ${arg1}

he enters as payee name
    [Arguments]    ${arg1}
    On DepositPage, Enter the Payee Name:    ${arg1}

the fund transfert must be completed
    On DepositPage, Check that Transfer is completed

the user is on Fund Transfer Page
    Launch Online Banking on Browser:    Chrome
    On Login Page, Enter Valid Credentials    Manakel    robert
    On HomePage, Choose to make a Deposit
