*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url_Google}     https://google.fr
${url_selenium_grid}    http://127.0.0.1:4442/wd/hub

*** Test Cases ***
Scenario: User on Google Search Page
    [Tags]    WEB    NOMINAL
    Given the user is on Google Page
    [Teardown]    Close Browser

*** Keywords ***
the user is on Google Page
    Open Browser    ${url_Google}    Chrome    driver1    ${url_selenium_grid}
