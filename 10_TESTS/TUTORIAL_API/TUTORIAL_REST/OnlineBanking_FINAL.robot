*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${payee_name}     NOT_SET
${transfer_amount}    0
${result}         NOT_SET

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
    Create Session    OnlineBanking    http://127.0.0.1:1026

he enters as payee name
    [Arguments]    ${arg1}
    ${valued_payee_name}=    Set Variable If    '${arg1}'== '[a_Registered_Payee_Name]'    Pierre(R)    Paul(N)
    Set Test Variable    ${payee_name}    ${valued_payee_name}

he enters as amount
    [Arguments]    ${arg1}
    ${valued_transfer_amount}=    Set Variable If    '${arg1}'== '[a Valid Transfer Amount]'    100    1000
    Set Test Variable    ${transfer_amount}    ${valued_transfer_amount}

he Submits request for Fund Transfer
    ${header}=    Create Dictionary    Content-Type=application/json
    ${json_payload}=    To Json    {"payee":"${payee_Name}","amount":"${Transfer_Amount}"}
    Log    ${json_payload}
    ${resp}=    Post Request    OnlineBanking    api/transfer    headers=${header}    data=${json_payload}
    Set Test Variable    ${result}    ${resp}

the fund transfert must be completed
    Should Be Equal As Strings    ${result.status_code}    200
    Dictionary Should Contain Key    ${result.json()}    status
    ${status_msg}=    Get From Dictionary    ${result.json()}    status
    Should be Equal as Strings    ${status_msg}    TRANSFER VALIDATED

a blocking error message must be displayed
    [Arguments]    ${arg1}
    Run Keyword If    '${arg1}'=='[Error: Too_Big_Amount]'    Set Test Variable    ${expected_status}    AMOUNT_TOO_BIG
    Run Keyword If    '${arg1}'=='[Error: Not_Registered_Payee]'    Set Test Variable    ${expected_status}    PAYEE_NOT_REGISTERED
    Should Be Equal As Strings    ${result.status_code}    422
    Dictionary Should Contain Key    ${result.json()}    status
    ${status_msg}=    Get From Dictionary    ${result.json()}    status
    Should be Equal as Strings    ${status_msg}    ${expected_status}
