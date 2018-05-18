*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
GoogleOnChrome
    Open Browser    https://www.google.fr    browser=Chrome    remote_url=http://127.0.0.1:4444/wd/hub
    Page Should Contain Image    id=hplogo
    Input Text    name=q    Ynov
    Click Element    name=btnK
    Capture Page Screenshot
    Page Should Contain Link    href=https://www.ynov.com
    Capture Page Screenshot
