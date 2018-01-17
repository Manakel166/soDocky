*** Settings ***
Library           AppiumLibrary
Resource          ../../../30_LIBRAIRIES/af_mobile/mobile_helpers.txt

*** Variables ***
&{app_under_test}    app=C://RF//RF_MOBILE//20_AUT//airfrance.apk

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
