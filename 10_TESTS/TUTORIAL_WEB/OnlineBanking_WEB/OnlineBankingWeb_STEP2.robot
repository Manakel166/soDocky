*** Settings ***
Library           Selenium2Library

*** Variables ***
${url_OnlineBanking}    http://127.0.0.1:1026
${url_selenium_grid}    http://127.0.0.1:4441/wd/hub

*** Test Cases ***
Scenario: Valid Payee
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Registered_Payee_Name]
    And he enters as amount    [a_Valid_Transfer_Amount]
    And he Submits request for Fund Transfer
    Then the fund transfert must be completed

Scenario: Invalid Payee
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Not_Registered_Payee_Name]
    And he enters as amount    [a_Valid_Transfer_Amount]
    And he Submits request for Fund Transfer
    Then a blocking error message must be displayed    [Error: Not_Registered_Payee]

Scenario: Too big amount for current account balance
    Given the user is on Fund Transfer Page
    When he enters as payee name    [a_Registered_Payee_Name]
    And he enters as amount    [a_Too_Big_Amount]
    And he Submits request for Fund Transfer
    Then a blocking error message must be displayed    [Error: Too_Big_Amount]

*** Keywords ***
Launch Online Banking on Browser:
    [Arguments]    ${Browser}= Chrome
    Open Browser    ${url_OnlineBanking}    ${Browser}    driver1    ${url_selenium_grid}

On DepositPage, Check that Transfer is completed
    Location should contain    transfer
    Page should contain    TRANSFERT VALIDATED
    Capture Page Screenshot

On DepositPage, Enter the Payee Name:
    [Arguments]    ${arg1}
    ${Payee_Name}=    Set Variable If    '${arg1}'=='[a_Registered_Payee_Name]'    Pierre(R)    Paul(N)
    Location Should Contain    transfer
    Select From List By Label    PayeesList    ${Payee_Name}

On DepositPage, Enter the Transfer Amount
    [Arguments]    ${arg1}
    ${Transfer_Amount}=    Set Variable If    '${arg1}'== '[a_Valid_Transfer_Amount]'    100    1000
    Input Text    Amount    ${Transfer_Amount}

On DepositPage, Validate the Transfer Request
    Location Should Contain    transfer
    Click Button    SubmitTransfer

On HomePage, Choose to make a Deposit
    Click Link    Make a Deposit
    Location Should Contain    transfer
    Page Should Not Contain    You are not logged in. Access denied.

On Login Page, Enter Valid Credentials
    [Arguments]    ${arg1}    ${arg2}
    Click Link    Authenticate
    Location Should Contain    login
    Input Text    UserName    ${arg1}
    Input Password    password    ${arg2}
    Click Button    LoginButton
    Element Should Not Be Visible    ErrorLogin    message= Login Failed

a blocking error message must be displayed
    [Arguments]    ${arg1}
    Run Keyword if     '${arg1}'=='[Error: Too_Big_Amount]'    On DepositPage, Check Blocking Error Message:    ERROR:AMOUNT_TOO_BIG
    Run Keyword if     '${arg1}'=='[Error: Not_Registered_Payee]'    On DepositPage, Check Blocking Error Message:    ERROR:PAYEE_NOT_REGISTERED

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

On DepositPage, Check Blocking Error Message:
    [Arguments]    ${expected_message}
    Location Should Contain     transfer
    Page Should Contain    ${expected_message}
    Capture Page Screenshot
