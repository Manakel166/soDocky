*** Settings ***
Library           AppiumLibrary
Resource          ../../../30_LIBRAIRIES/af_mobile/mobile_helpers.txt

*** Variables ***
&{app_under_test}    app=../../../../20_AUT/airfrance.apk
${FlightNews_Screen}    ${FlightNews_Screen}
${popup_update_application}    popup_update_application
${Update_later_button}    Update_later_button
${SigninScreen}    SigninScreen
${Skip_SignIn_Button}    Skip_SignIn_Button
${confirm_language_screen}    confirm_language_screen
${confirm_current_language}    confirm_current_language
${HomePage_Screen}    HomePage_Screen
${flight_news_tile}    flight_news_tile

*** Test Cases ***
Access to Flight News
    GIVEN I am on AirFrance HomePage
    THEN I can select "Flight News" from HomePage

*** Keywords ***
I am on AirFrance HomePage
    Open the AirFrance App
    At Launch, Refuse to Update the App
    At Launch, Skip the login Step
    At Launch, Confirm the UK Language
    Check that I’m on the AirFrance HomePage

I can select "Flight News" from HomePage
    On Homepage, Select "Flight news"
    Check that I’m on the "Flight news" Page.

Open the AirFrance App
    Launch Application on Local Device    &{app_under_test}

At Launch, Refuse to Update the App
    Wait Until Page Contains Element    ${popup_update_application}    10s    The Popup to update the application did not appear in time
    Click Element    ${Update_later_button}

At Launch, Skip the login Step
    Wait Until Page Contains Element    ${SigninScreen}
    Click Element    ${Skip_SignIn_Button}

At Launch, Confirm the UK Language
    Wait Until Page Contains Element    ${confirm_language_screen}
    Click Element    ${confirm_current_language}

Check that I’m on the AirFrance HomePage
    I'm on Homepage

I'm on Homepage
    Page Should Contain Element    ${HomePage_Screen}

On Homepage, Select "Flight news"
    I'm on Homepage
    Click Element    ${flight_news_tile}

Check that I’m on the "Flight news" Page.
    Page Should Contain Element    ${FlightNews_Screen}
